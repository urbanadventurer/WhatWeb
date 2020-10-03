# Copyright 2009 to 2020 Andrew Horton and Brendan Coles
#
# This file is part of WhatWeb.
#
# WhatWeb is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# at your option) any later version.
#
# WhatWeb is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with WhatWeb.  If not, see <http://www.gnu.org/licenses/>.

module WhatWeb
  class Scan
    def initialize(urls, input_file: nil, url_prefix: nil, url_suffix: nil, url_pattern: nil, max_threads: 25)
      urls = [urls] if urls.is_a?(String)

      @targets = make_target_list(
        urls,
        input_file: input_file,
        url_prefix: url_prefix,
        url_suffix: url_suffix,
        url_pattern: url_pattern
      )

      error('No targets selected') if @targets.empty?

      @max_threads = max_threads.to_i || 25
      @target_queue = Queue.new # workers consume from this
    end

    def scan
      Thread.abort_on_exception = true if $WWDEBUG

      workers = (1..@max_threads).map do
        Thread.new do
          # keep reading in root tasks until a nil is received
          loop do
            target = @target_queue.pop
            Thread.exit unless target

            # keep processing until there are no more redirects or the limit is hit
            # while target
            begin
              target.open
            rescue => e
              error("ERROR Opening: #{target} - #{e}")
              target = nil # break target loop
              next
            end

            yield target
          end
        end
      end

      # initialize target_queue
      @targets.each do |url|
        target = prepare_target(url)
        next unless target
        @target_queue << target
      end

      # exit

      loop do
        # this might miss redirects from final targets

        # more defensive than comparing against max_threads
        alive = workers.map { |worker| worker if worker.alive? }.compact.length
        break if alive == @target_queue.num_waiting && @target_queue.empty?
      end

      # Shut down workers, logging, and plugins
      (1..@max_threads).each { @target_queue << nil }
      workers.each(&:join)
    end

    # for use by Plugins
    def scan_from_plugin(target: nil)
      raise 'No target' unless target

      begin
        target.open
      rescue => e
        error("ERROR Opening: #{target} - #{e}")
      end
      target
    end

    def add_target(url, redirect_counter = 0)
      # TODO: REVIEW: should this use prepare_target?
      target = Target.new(url, redirect_counter)

      unless target
        error("Add Target Failed - #{url}")
        return
      end

      @target_queue << target
    end

    private

    # try to make a new Target object, may return nil
    def prepare_target(url)
      Target.new(url)
    rescue => e
      error("Prepare Target Failed - #{e}")
      nil
    end

    #
    # Make Target List
    #
    # Make a list of targets from a list of URLs and/or input file
    #
    def make_target_list(urls, opts = {})
      url_list = []

      # parse URLs
      if urls.is_a?(Array)
        urls.flatten.reject { |u| u.nil? }.map { |u| u.strip }.reject { |u| u.eql?('') }.each do |url|
          url_list << url
        end
      end

      # parse input file
      # read each line as a url, skipping lines that begin with a #
      inputfile = opts[:input_file] || nil
      if !inputfile.nil? && File.exist?(inputfile)
        pp "loading input file: #{inputfile}" if $verbose > 2
        File.open(inputfile).readlines.each(&:strip!).reject { |line| line.start_with?('#') || line.eql?('') }.each do |line|
          url_list << line
        end
      end

      return [] if url_list.empty?

      # TODO: refactor this
      ip_range = url_list.map do |x|
        range = nil
        # Parse IP ranges
        if x =~ %r{^[0-9\.\-\/]+$} && x !~ %r{^[\d\.]+$}
          begin
            # CIDR notation
            if x =~ %r{\d+\.\d+\.\d+\.\d+/\d+$}
              range = IPAddr.new(x).to_range.map(&:to_s)
            # x.x.x.x-x
            elsif x =~ %r{^(\d+\.\d+\.\d+\.\d+)-(\d+)$}
              start_ip = IPAddr.new(Regexp.last_match(1), Socket::AF_INET)
              end_ip   = IPAddr.new("#{start_ip.to_s.split('.')[0..2].join('.')}.#{Regexp.last_match(2)}", Socket::AF_INET)
              range = (start_ip..end_ip).map(&:to_s)
            # x.x.x.x-x.x.x.x
            elsif x =~ %r{^(\d+\.\d+\.\d+\.\d+)-(\d+\.\d+\.\d+\.\d+)$}
              start_ip = IPAddr.new(Regexp.last_match(1), Socket::AF_INET)
              end_ip   = IPAddr.new(Regexp.last_match(2), Socket::AF_INET)
              range = (start_ip..end_ip).map(&:to_s)
            end
          rescue => e
            # Something went horribly wrong parsing the target IP range
            raise "Error parsing target IP range: #{e}"
          end
        end
        range
      end.compact.flatten

      # TODO: refactor this. data which matches these regexs should be taken care of above
      url_list = url_list.select { |x| !(x =~ %r{^[0-9\.\-*\/]+$}) || x =~ /^[\d\.]+$/ }
      url_list += ip_range unless ip_range.empty?

      # make urls friendlier, test if it's a file, if test for not assume it's http://
      # http, https, ftp, etc
      push_to_urllist = []

      # TODO: refactor this
      url_list = url_list.map do |x|
        if File.exist?(x)
          x
        else
          # use url pattern
          x = opts[:url_pattern].gsub('%insert%', x) unless opts[:url_pattern].to_s.eql?('')
          # add prefix & suffix
          x = "#{opts[:url_prefix]}#{x}#{opts[:url_suffix]}"

          # need to move this into a URI parsing function
          #
          # check for URI prefix
          if x !~ %r{^[a-z]+:\/\/}
            # add missing URI prefix
            x.sub!(/^/, 'http://')
          end

          # is it a valid domain?
          begin
            domain = Addressable::URI.parse(x)
            # check validity
            raise 'Unable to parse invalid target. No hostname.' if domain.host.empty?

            # convert IDN domain
            x = domain.normalize.to_s if domain.host !~ %r{^[a-zA-Z0-9\.:\/]*$}
          rescue => e
            # if it fails it's not valid
            x = nil
            # TODO: print something more useful
            error("Unable to parse invalid target #{x}: #{e}")
          end
          # return x
          x
        end
      end

      url_list += push_to_urllist unless push_to_urllist.empty?

      # compact removes nils
      url_list = url_list.flatten.compact # .sort.uniq
    end
  end
end
