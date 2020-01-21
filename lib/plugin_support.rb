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


# this class contains stuff related to plugins but not necessary to repeat in each plugin we create
class PluginSupport
  # this is used by load_plugins
  def self.load_plugin(f)
    load f

  rescue ArgumentError => err
    if err.message =~ /wrong number of arguments \(given 1, expected 0\)/
      # this error can be caused by other reasons
      error("Error loading plugin #{f}. This plugin may be using a deprecated plugin format for WhatWeb version < 0.5.0. Error message: #{err.message}")
    end
    raise if $WWDEBUG == true

  rescue SyntaxError => err
    error("Error loading plugin #{f}. Error details: #{err.message}")
    raise if $WWDEBUG == true

  rescue Interrupt
    error("Interrupt detected. Failed to load plugin #{f}.")
    raise if $WWDEBUG == true
    exit 1 # exit with ctrl-c
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
      plugin_name = 'Grep'

      matches = if c[0] == '/' && c[-1] == '/'
                  # it's a regex. this might cause some issues?
                  "matches([:regexp=>/#{c[1..-2]}/])"
                else
                  "matches([:text=>\"#{c}\"])"
                end
    else
      # define a custom plugin on the cmdline
      # ":text=>'powered by abc'" or
      # "{:text=>'powered by abc'},{:regexp=>/abc [ ]?1/i}"

      # then it's ok..
      if c =~ /:(text|ghdb|md5|regexp|tagpattern)=>[\/'"].*/
        matches = "matches([\{#{c}\}])"
      end

      # this isn't checked for sanity... loading plugins = cmd exec anyway
      matches = "matches([#{c}])" if c =~ /\{.*\}/

      plugin_name = 'Custom-Plugin'

      abort("Invalid custom plugin syntax: #{c}") if matches.nil?
    end

    custom = %(
    Plugin.define do
    name "#{plugin_name}"
    authors ["WhatWeb"]
    description "User defined"
    website "User defined"
    #{matches}
    end
    )

    begin
      pp custom if $verbose > 2
      eval(custom)
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
    puts "Plugin" + " " * 24 + "Website"
    puts '-' * terminal_width
    Plugin.registered_plugins.sort_by { |a, _b| a.downcase }.each do |n, p|
      next if n == "?" # skip the Easter Egg plugin

      # output fits more description onto a line
      line = "#{n}"
      spaces = terminal_width - 50 - n.size
      spaces = 1 if spaces <= 0
      line += " " * spaces
      line += p.website if p.website
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
      next if name == "?" # skip the Easter Egg plugin
      dump = [name, plugin.authors, plugin.description, plugin.website, plugin.matches].flatten.compact.to_a.join.downcase

      # this will fail is an expected variable is not defined or empty
      next unless keywords.empty? || keywords.map { |k| dump.include?(k.downcase) }.compact.include?(true)
      puts '=' * terminal_width
      puts 'Plugin:'.ljust(16) + name
      puts '-' * terminal_width

      if plugin.description
        Helper::word_wrap(plugin.description, terminal_width - 16).each_with_index do |line, index|
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
