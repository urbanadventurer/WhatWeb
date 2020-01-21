# Copyright 2009 to 2020 Andrew Horton and Brendan Coles
#
# This file is part of WhatWeb.
#
# WhatWeb is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or at your option) any later version.
#
# WhatWeb is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with WhatWeb.  If not, see <http://www.gnu.org/licenses/>.

class Plugin
  class << self
    attr_reader :registered_plugins, :attributes
    private :new
  end

  @registered_plugins = {}
  @attributes = %i(
    aggressive
    authors
    description
    dorks
    matches
    name
    passive
    version
    website
  )

  @attributes.each do |symbol|
    define_method(symbol) do |*value, &block|
      name = "@#{symbol}"
      if block
        instance_variable_set(name, block)
      elsif !value.empty?
        instance_variable_set(name, *value)
      else
        instance_variable_get(name)
      end
    end
  end

  def initialize
    @matches = []
    @dorks = []
    @passive = nil
    @aggressive = nil
    @variables = {}
    @website = nil
  end

  def self.define(&block)
    # TODO: plugins should isolated
    p = new
    p.instance_eval(&block)
    p.startup
    # TODO: make sure required attributes are set
    Plugin.attributes.each { |symbol| p.instance_variable_get("@#{symbol}").freeze }
    Plugin.registered_plugins[p.name] = p
  end

  def self.shutdown_all
    Plugin.registered_plugins.each { |_, plugin| plugin.shutdown }
  end

  def version_detection?
    return false unless @matches
    !@matches.map { |m| m[:version] }.compact.empty?
  end

  # individual plugins can override this
  def startup; end

  # individual plugins can override this
  def shutdown; end

  def scan(target)
    scan_context = ScanContext.new(plugin: self, target: target, scanner: nil)
    scan_context.instance_variable_set(:@variables, @variables)
    scan_context.x
  end
end

class ScanContext
  def initialize(plugin: nil, target: nil, scanner: nil)
    @plugin = plugin
    @matches = plugin.matches
    define_singleton_method(:passive_scan, plugin.passive) if plugin.passive
    define_singleton_method(:aggressive_scan, plugin.aggressive) if plugin.aggressive
    @target = target
    @body = target.body
    @headers = target.headers
    @status = target.status
    @base_uri = target.uri
    @md5sum = target.md5sum
    @tagpattern = target.tag_pattern
    @ip = target.ip
    @raw_response = target.raw_response
    @raw_headers = target.raw_headers
    @scanner = scanner
  end

  def make_matches(target, match)
    r = []

    # search location
    search_context = target.body # by default
    if match[:search]
      case match[:search]
      when 'all'
        search_context = target.raw_response
      when 'headers'
        search_context = target.raw_headers
      when /headers\[(.*)\]/
        header = Regexp.last_match(1).downcase

        if target.headers[header]
          search_context = target.headers[header]
        else
          # error "Invalid search context :search => #{match[:search]}"
          return r
        end
      end
    end

    if match[:ghdb]
      r << match if match_ghdb(match[:ghdb], target.body, target.headers, target.status, target.uri)
    end

    if match[:text]
      r << match if match[:regexp_compiled] =~ search_context
    end

    if match[:md5]
      r << match if target.md5sum == match[:md5]
    end

    if match[:tagpattern]
      r << match if target.tag_pattern == match[:tagpattern]
    end

    if match[:regexp_compiled] && search_context
      [:regexp, :account, :version, :os, :module, :model, :string, :firmware, :filepath].each do |symbol|
        next unless match[symbol] && match[symbol].class == Regexp
        regexpmatch = search_context.scan(match[:regexp_compiled])
        next if regexpmatch.empty?
        m = match.dup
        m[symbol] = regexpmatch.map do |eachmatch|
          if eachmatch.is_a?(Array) && match[:offset]
            eachmatch[match[:offset]]
          elsif eachmatch.is_a?(Array)
            eachmatch.first
          elsif eachmatch.is_a?(String)
            eachmatch
          end
        end.flatten.compact.sort.uniq
        r << m
      end
    end

    # all previous matches are OR
    # these are ARE. e.g. required if present
    return r if r.empty?

    # if url and status are present, they must both match
    # url and status cannot be alone. there must be something else that has already matched
    url_matched = false
    status_matched = false

    if match[:status]
      status_matched = true if match[:status] == target.status
    end

    if match[:url]
      # url is not relative if :url starts with /
      # url is relative if :url starts with [^/]
      # url query is only checked if :url has a ?
      # {:url="edit?action=stop" } will only match if the end of the path and the entire query matches.
      # :url is for URIs not regexes

      is_relative = if match[:url] =~ /^\//
                      false
                    else
                      true
                    end

      has_query = if match[:url] =~ /\?/
                    true
                  else
                    false
                  end

      if is_relative && !has_query
        url_matched = true if target.uri.path =~ /#{match[:url]}$/
      end

      if is_relative && has_query
        if target.uri.query
          url_matched = true if "#{target.uri.path}?#{target.uri.query}" =~ /#{match[:url]}$/
        end
      end

      if !is_relative && has_query
        if target.uri.query
          url_matched = true if "#{target.uri.path}?#{target.uri.query}" == match[:url]
        end
      end

      if !is_relative && !has_query
        url_matched = true if target.uri.path == match[:url]
      end
    end

    # determine whether to return a match
    if match[:status] && match[:url]
      if url_matched && status_matched
        r << match
      else
        r = []
      end
    elsif match[:status] && match[:url].nil?
      if status_matched
        r << match
      else
        r = []
      end
    elsif !match[:status] && match[:url]
      if url_matched
        r << match
      else
        r = []
      end
    elsif !match[:status] && !match[:url]
      # nothing to do
    end

    r
  end

  # execute plugin
  def x
    results = []
    unless @matches.nil?
      @matches.each do |match|
        results += make_matches(@target, match)
      end
    end

    # if the plugin has a passive method, use it
    results += passive_scan if @plugin.passive

    # if the plugin has an aggressive method and we're in aggressive mode, use it
    # or if we're guessing all URLs
    if ($AGGRESSION == 3 && results.any?) || ($AGGRESSION == 4)
      results += aggressive_scan if @plugin.aggressive
      # if any of our matches have a url then fetch it
      # and check the matches[]
      # later we can do some caching

      # we have no caching, so we sort the URLs to fetch and only get 1 unique url per plugin. not great..
      if @matches
        @matches.map { |x| x if x[:url] }.compact.sort_by { |x| x[:url] }.map do |match|
          newbase_uri = URI.join(@base_uri.to_s, match[:url]).to_s

          # todo: use scanner here
          aggressivetarget = Target.new(newbase_uri)
          aggressivetarget.open

          #        if $verbose >1
          #          puts "#{@plugin_name} Aggressive: #{aggressivetarget.uri.to_s} [#{aggressivetarget.status}]"
          #        end

          results += make_matches(aggressivetarget, match)
        end
      end
    end
    # clean up results
    unless results.empty?
      results.each do |r|
        # default certainty is 100%
        r[:certainty] = 100 if r[:certainty].nil?
      end
    end

    results
  end
end
