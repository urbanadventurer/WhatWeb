# Copyright 2009 to 2017, Andrew Horton and Brendan Coles
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

  def initialize(urls, opts)

  targets = make_target_list(
    urls,
    input_file: opts[:input_file],
    url_prefix: opts[:url_prefix] || '',
    url_suffix: opts[:url_suffix] || '',
    url_pattern: opts[:url_pattern]
  )

  if targets.empty?
    error('No targets selected. Exiting.')
    exit 1
  end

  target_queue = Queue.new # workers consume from this
  result_queue = Queue.new # workers return results here for output
  result_mutex = Mutex.new
  Thread.abort_on_exception = true if $WWDEBUG
  max_threads = opts[:max_threads].to_i || 25

  workers = (1..max_threads).map do
    Thread.new do
      # keep reading in root tasks until a nil is received
      loop do
        target = target_queue.pop
        Thread.exit unless target
        redirects = 0
        # keep processing until there are no more redirects or the limit is hit
        while target # wtf?
          begin
            target.open
          rescue => err
            error("ERROR Opening: #{target} - #{err}")
            target = nil # break target loop
            next
          end
          result = run_plugins(target)
          result_mutex.synchronize do
            result_queue << [target, result]
          end
          redirect_url = target.get_redirection_target
          if redirect_url
            redirects += 1
            target = prepare_target(redirect_url)
            if redirects > $MAX_REDIRECTS
              error("ERROR Too many redirects: #{target}")
              break
            end
          else
            target = nil
          end
        end
      end
    end
  end

  targets.each do |url|
    target = prepare_target(url)
    target_queue << target if target
  end

  loop do
    break if result_mutex.synchronize do
      # more defensive than comparing against max_threads
      alive = workers.map { |worker| worker if worker.alive? }.compact.length
      alive == target_queue.num_waiting && result_queue.empty?
    end

    if result_queue.empty?
      # sleep 0.1
      next
    end

    target, result = result_queue.pop(true)

    yield target,result
    #  pp target, result
  end

  # Shut down workers, output, and plugins
  (1..max_threads).each { target_queue << nil }
  workers.each(&:join)
  opts[:output_list].each(&:close)
  Plugin.registered_plugins.each { |_, plugin| plugin.shutdown }
  # pp $PLUGIN_TIMES.sort_by {|x,y|y }
  end

  private

  # try to make a new Target object, may return nil
  def prepare_target(url)
    Target.new(url)
  rescue => err
    error("Prepare Target Failed - #{err}")
    nil
  end

  def run_plugins(target)
    results = []

    $plugins_to_use.each do |name, plugin|
      begin
        # eXecute the plugin
        # start_time = Time.now
        result = plugin.scan(target)
        # end_time = Time.now
        # $PLUGIN_TIMES[name] += end_time - start_time
      rescue Exception => err
        error("ERROR: Plugin #{name} failed for #{target}. #{err}")
        raise if $WWDEBUG == true
      end
      results << [name, result] unless result.nil? || result.empty?
    end
    results
  end

  #
  # Make Target List
  #
  # Make a list of targets from a list of URLs and/or input file
  #
  def make_target_list(urls, opts)
    url_list = urls
    inputfile = opts[:input_file] || nil

    # read each line as a url, skipping lines that begin with a #
    if !inputfile.nil? && File.exist?(inputfile)
      pp "loading input file: #{inputfile}" if $verbose > 2
      url_list += File.open(inputfile).readlines.each(&:strip!).delete_if { |line| line =~ /^#.*/ }.each { |line| line.delete!("\n") }
    end

    genrange = url_list.map do |x|
      range = nil
      # Parse IP ranges
      if x =~ /^[0-9\.\-\/]+$/ && x !~ /^[\d\.]+$/
        begin
          # CIDR notation
          if x =~ %r{\d+\.\d+\.\d+\.\d+/\d+$}
            range = IPAddr.new(x).to_range.map(&:to_s)
          # x.x.x.x-x
          elsif x =~ /^(\d+\.\d+\.\d+\.\d+)-(\d+)$/
            start_ip = IPAddr.new(Regexp.last_match(1), Socket::AF_INET)
            end_ip   = IPAddr.new("#{start_ip.to_s.split('.')[0..2].join('.')}.#{Regexp.last_match(2)}", Socket::AF_INET)
            range = (start_ip..end_ip).map(&:to_s)
          # x.x.x.x-x.x.x.x
          elsif x =~ /^(\d+\.\d+\.\d+\.\d+)-(\d+\.\d+\.\d+\.\d+)$/
            start_ip = IPAddr.new(Regexp.last_match(1), Socket::AF_INET)
            end_ip   = IPAddr.new(Regexp.last_match(2), Socket::AF_INET)
            range = (start_ip..end_ip).map(&:to_s)
          end
        rescue
          # Something went horribly wrong parsing the target IP range
          raise 'Error parsing target IP range'
        end
      end
      range
    end.compact.flatten

    url_list = url_list.select { |x| !(x =~ /^[0-9\.\-*\/]+$/) || x =~ /^[\d\.]+$/ }
    url_list += genrange unless genrange.empty?

    # make urls friendlier, test if it's a file, if test for not assume it's http://
    # http, https, ftp, etc
    push_to_urllist = []
    url_list = url_list.map do |x|
      if File.exist?(x)
        x
      else
        # use url pattern
        x = opts[:url_pattern].gsub('%insert%', x) if opts[:url_pattern]
        # add prefix & suffix
        x = opts[:url_prefix] + x + opts[:url_suffix]

        # need to move this into a URI parsing function
        #
        # check for URI prefix
        if x !~ /^[a-z]+:\/\//
          # add missing URI prefix
          x.sub!(/^/, 'http://')
        end

        # is it a valid domain?
        begin
          domain = Addressable::URI.parse(x)
          # check validity
          raise 'Unable to parse invalid target. No hostname.' if domain.host.empty?

          # convert IDN domain
          x = domain.normalize.to_s if domain.host !~ /^[a-zA-Z0-9\.:\/]*$/
        rescue
          # if it fails it's not valid
          x = nil
          error("Unable to parse invalid target #{x}")
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
