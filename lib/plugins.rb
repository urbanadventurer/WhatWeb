# Copyright 2009, 2017 Andrew Horton and Brendan Coles
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

  def version_detection?
    return false unless @matches
    !@matches.map { |m| m[:version] }.compact.empty?
  end

  # individual plugins can override this
  def startup; end

  # individual plugins can override this
  def shutdown; end

  def scan(target)
    scan_context = ScanContext.new(self, target)
    scan_context.instance_variable_set(:@variables, @variables)
    scan_context.x
  end
end

class ScanContext
  def initialize(plugin, target)
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
        lastbase_uri. thisstatus, thisurl, thisbody, thisheaders = nil # this shouldn't be necessary but ruby thinks its a local variable to the if end statement

        @matches.map { |x| x if x[:url] }.compact.sort_by { |x| x[:url] }.map do |match|
          r = [] # temp results

          newbase_uri = URI.join(@base_uri.to_s, match[:url]).to_s
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

# this class contains stuff related to plugins but not necessary to repeat in each plugin we create
class PluginSupport
  # this is used by load_plugins
  def self.load_plugin(f)
    load f
  rescue => err
    error("Error: failed to load - #{err}")
  rescue SyntaxError => err
    error("Error: Failed to load - #{err}")
  rescue SystemExit, Interrupt
    error('ERROR: Failed to load plugins: Interrupted')
    raise if $WWDEBUG == true || $verbose > 1
    exit 1
  end

  # precompile regular expressions in plugins for performance
  def self.precompile_regular_expressions
    Plugin.registered_plugins.each do |thisplugin|
      matches = thisplugin[1].matches
      next if matches.nil?
      matches.each do |thismatch|
        unless thismatch[:regexp].nil?
          # pp thismatch
          thismatch[:regexp_compiled] = Regexp.new(thismatch[:regexp])
        end

        [:version, :os, :string, :account, :model, :firmware, :module, :filepath].each do |label|
          if !thismatch[label].nil? && thismatch[label].class == Regexp
            thismatch[:regexp_compiled] = Regexp.new(thismatch[label])
            # pp thismatch
          end
        end

        unless thismatch[:text].nil?
          thismatch[:regexp_compiled] = Regexp.new(Regexp.escape(thismatch[:text]))
        end
      end
    end
  end

  # for adding/removing sets of plugins.
  #
  # --plugins +plugins-disabled,-foobar (+ adds to the full set, -removes from the fullset. items can be directories, files or plugin names)
  # --plugins +/tmp/moo.rb
  # --plugins foobar (only select foobar)
  # --plugins ./plugins-disabled,-md5 (select only plugins from the plugins-disabled folder, remove the md5 plugin from the selected list)
  #
  # does not work correctly with mixed plugin names and files
  #
  def self.load_plugins(list = nil)
    a = []
    b = []

    plugin_dirs = PLUGIN_DIRS.clone
    plugin_dirs.map { |p| p = File.expand_path(p) }

    # no selection, so it's default
    unless list
      plugin_dirs.each do |d|
        Dir.glob("#{d}/*.rb").each { |x| PluginSupport.load_plugin(x) }
      end
      return Plugin.registered_plugins
    end

    # separate list into a and b
    #  a = make list of dir & filenames
    #  b = make list of assumed pluginnames

    list.split(',').each do |p|
      choice = PluginChoice.new
      choice.fill(p)
      a << choice if choice.type == 'file'
      b << choice if choice.type == 'plugin'
    end

    # puts "a: list of dir + filenames"
    # pp a
    # puts "b: list of plugin names"
    # pp b
    # puts "Plugin Dirs"
    # pp plugin_dirs

    # sort by neither, add, minus
    a = a.sort

    # plugin_dirs gets wiped out if no modifier is used on a file/folder
    plugin_dirs = [] if a.map(&:modifier).include?(nil)

    minus_files = [] # make list of files not to load
    a.map do |c|
      plugin_dirs << c.name if c.modifier.nil? || c.modifier == '+'
      plugin_dirs -= [c.name] if c.modifier == '-' # for Dirs
      minus_files << c.name if c.modifier == '-' # for files
    end

    # puts "Plugin Dirs"
    # pp plugin_dirs

    # puts "before plugin_dirs.each "
    # pp Plugin.registered_plugins.size

    # load files from plugin_dirs unless a file is minused
    plugin_dirs.each do |d|
      # if a folder, then load all files
      if File.directory?(d)
        (Dir.glob("#{d}/*.rb") - minus_files).each { |x| PluginSupport.load_plugin(x) }
      elsif File.exist?(d)
        PluginSupport.load_plugin(d)
      else
        error("Error: #{d} is not Dir or File")
      end
    end

    # puts "after plugin_dirs.each "
    # pp Plugin.registered_plugins.size

    # make list of plugins to run
    # go through all plugins, remove from list any that match b minus
    selected_plugin_names = []

    if b.map(&:modifier).include?(nil)
      selected_plugin_names = []
    else
      selected_plugin_names = Plugin.registered_plugins.map { |n, _p| n.downcase }
    end

    b.map do |c|
      selected_plugin_names << c.name if c.modifier.nil? || c.modifier == '+'
      selected_plugin_names -= [c.name] if c.modifier == '-'
    end

    # pp selected_plugin_names
    # Plugin.registered_plugins is getting wiped out

    plugins_to_use = Plugin.registered_plugins.map do |n, p|
      [n, p] if selected_plugin_names.include?(n.downcase)
    end.compact
    # puts "after "

    # report on plugins that couldn't be found
    unfound_plugins = selected_plugin_names - plugins_to_use.map { |n, _p| n.downcase }
    unless unfound_plugins.empty?
      puts 'Error: The following plugins were not found: ' + unfound_plugins.join(',')
    end

    # puts "-" * 80
    # pp plugins_to_use

    plugins_to_use
  end

  def self.custom_plugin(c, *option)
    if option == ['grep']

      matches = if c[0] == '/' && c[-1] == '/'
                  # it's a regex. this might cause some issues?
                  "matches [:regexp=>/#{c[1..-2]}/]"
                else
                  "matches [:text=>\"#{c}\"]"
                end

      custom = %( # coding: ascii-8bit
      Plugin.define do
      name "Grep"
      authors ["Unknown"]
      description "User defined"
      website "User defined"
      #{matches}
      end
      )
    else
      # define a custom plugin on the cmdline
      # ":text=>'powered by abc'" or
      # "{:text=>'powered by abc'},{:regexp=>/abc [ ]?1/i}"

      # then it's ok..
      if c =~ /:(text|ghdb|md5|regexp|tagpattern)=>[\/'"].*/
        matches = "matches [\{#{c}\}]"
      end

      # this isn't checked for sanity... loading plugins = cmd exec anyway
      matches = "matches [#{c}]" if c =~ /\{.*\}/

      abort("Invalid custom plugin syntax: #{c}") if matches.nil?

      custom = %( # coding: ascii-8bit
      Plugin.define do
      name "Custom-Plugin"
      authors ["Unknown"]
      description "User defined"
      website "User defined"
      #{matches}
      end
      )
    end

    begin
      # open tmp file
      f = Tempfile.new('whatweb-custom-plugin')
      # write
      f.write(custom)
      f.close
      pp custom if $verbose > 2
      # load
      load f.path
      f.unlink
      true
    rescue SyntaxError
      error('Error: Cannot load custom plugin')
      false
    end
  end

  ### some UI stuff
  def self.plugin_list
    terminal_width = 80
    puts 'WhatWeb Plugin List'
    puts
    puts 'Plugin Name - Description'
    puts '-' * terminal_width
    Plugin.registered_plugins.sort_by { |a, _b| a.downcase }.each do |n, p|
      # output fits more description onto a line
      line = "#{n} - "
      line += p.description.delete("\r\n") unless p.description.empty?

      if line.size > terminal_width - 1
        line = line[0..terminal_width - 4] + '...'
      end
      puts line
    end
    puts '-' * terminal_width
    puts
    puts "Total: #{Plugin.registered_plugins.size} Plugins"
    puts
    puts 'Hint:'
    puts 'For complete plugin descriptions use : whatweb --info-plugins <SEARCH>'
    puts 'Use it without a search term for a complete description of all plugins.'
    puts
  end

  # Show Google Dorks
  def self.plugin_dorks(plugin_name)
    dorks = []

    # Loop through plugins
    Plugin.registered_plugins.each do |n, p|
      if n.casecmp(plugin_name.downcase).zero?
        pp "Google Dorks for #{n}:" if $verbose > 2
        dorks << p.dorks unless p.dorks.empty?
      end
    end

    # Show results if present, else show error message
    if !dorks.empty?
      puts dorks
    else
      error('Google dork lookup failed: Invalid plugin name or no dorks available')
    end
  end

  # Show plugin information
  def self.plugin_info(keywords = nil)
    terminal_width = 80

    puts 'WhatWeb Detailed Plugin List'
    puts 'Searching for ' + keywords.join(',') unless keywords.empty?

    count = { plugins: 0, version_detection: 0, matches: 0, dorks: 0, aggressive: 0, passive: 0 }

    Plugin.registered_plugins.sort_by { |a, _b| a.downcase }.each do |name, plugin|
      dump = [name, plugin.authors, plugin.description, plugin.website, plugin.matches].flatten.compact.to_a.join.downcase

      # this will fail is an expected variable is not defined or empty
      next unless keywords.empty? || keywords.map { |k| dump.include?(k.downcase) }.compact.include?(true)
      puts '=' * terminal_width
      puts 'Plugin:'.ljust(16) + name
      puts '-' * terminal_width

      if plugin.description
        word_wrap(plugin.description, terminal_width - 16).each_with_index do |line, index|
          if index == 0
            print 'Description:'.ljust(16)
          else
            print ' ' * 16
          end
          puts line
        end
      else
        puts 'Description:'.ljust(16) + '<Not defined>'
      end

      puts 'Website:'.ljust(16) + (plugin.website || '<Not defined>')
      puts

      authors = (if plugin.authors.empty?
                   '<Not defined>'
                 else
                   plugin.authors.join(', ')
                 end)
      puts 'Authors:'.ljust(16) + authors

      puts 'Version:'.ljust(16) + (plugin.version || '<Not defined>')
      puts
      print 'Features:'.ljust(16)

      print "[#{plugin.matches.any? ? 'Yes' : 'No'}]".ljust(7) + 'Pattern Matching'

      if plugin.matches.any?
        puts " (#{plugin.matches.size})"
      else
        puts
      end

      puts ' ' * 16 + "[#{plugin.version_detection? ? 'Yes' : 'No'}]".ljust(7) + 'Version detection from pattern matching'
      puts ' ' * 16 + "[#{plugin.passive ? 'Yes' : 'No'}]".ljust(7) + 'Function for passive matches'
      puts ' ' * 16 + "[#{plugin.aggressive ? 'Yes' : 'No'}]".ljust(7) + 'Function for aggressive matches'

      count[:version_detection] += 1 if plugin.version_detection?
      count[:passive] += 1 if plugin.passive
      count[:aggressive] += 1 if plugin.aggressive

      print ' ' * 16 + "[#{plugin.dorks.any? ? 'Yes' : 'No'}]".ljust(7) + 'Google Dorks'
      if plugin.dorks.empty?
        puts
      else
        puts " (#{plugin.dorks.size})"
      end

      puts

      unless plugin.dorks.empty?
        puts 'Google Dorks:'
        plugin.dorks.each_with_index do |dork, index|
          puts "[#{index + 1}] #{dork}"
        end
        puts
        count[:dorks] += plugin.dorks.size
      end

      count[:matches] += plugin.matches.size if plugin.matches
      count[:plugins] += 1
    end

    puts '=' * terminal_width
    puts "Total plugins: #{count[:plugins]}"
    puts "Total plugins with version detection from pattern matching: #{count[:version_detection]}"
    puts "Total patterns (regular expressions, text, MD5 hashes, etc): #{count[:matches]}"
    puts "Total Google dorks: #{count[:dorks]}"
    puts "Total aggressive functions: #{count[:aggressive]}"
    puts "Total passive functions: #{count[:passive]}"
    puts
  end
end

# This is used in plugin selection by load_plugins
class PluginChoice
  attr_accessor :modifier, :type, :name

  def <=>(_s)
    x = -1 if modifier.nil?
    x = 0 if modifier == '+'
    x = 1 if modifier == '-'
    x
  end

  def fill(s)
    self.modifier = nil
    self.modifier = s[0].chr if ['+', '-'].include?(s[0].chr)

    self.name = if modifier
                  s[1..-1]
                else
                  s
                end

    # figure out and store the filename or pluginname
    if File.exist?(File.expand_path(name))
      self.type = 'file'
      self.name = File.expand_path(name)
    else
      name.downcase!
      self.type = 'plugin'
    end
  end
end
