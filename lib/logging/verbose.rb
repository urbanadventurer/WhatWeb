
class LoggingVerbose < Logging
  def coloured(s, colour)
    use_colour = ((@f == STDOUT && $use_colour == 'auto') || ($use_colour == 'always'))
    if use_colour
      send colour, s
    else
      s
    end
  end

  def out(target, status, results)
    $semaphore.synchronize do
      # make a hash of the matches array
      results_hash = {}
      results.map { |k, v| results_hash[k] = v }

      display = {
        title: '<None>',
        ip: '<Unknown>',
        country: '<Unknown>',
        status: '<Unknown>'
      }

      display[:country] = results_hash['Country'].map { |r| "#{r[:string]}, #{r[:module]}" }.join(',') if results_hash['Country']
      display[:ip] = results_hash['IP'].map { |r| r[:string] }.join(',') if results_hash['Country']
      display[:title] = results_hash['Title'].map { |r| r[:string] }.join(',') if results_hash['Title']
      display[:status] = status.to_s + ' ' + HTTP_Status.code(status)

      @f.puts "WhatWeb report for #{coloured(target, 'blue')}"
      @f.puts 'Status'.ljust(9) + ' : ' + display[:status]
      @f.puts 'Title'.ljust(9) + " : #{coloured(display[:title], 'yellow')}"
      @f.puts 'IP'.ljust(9) + ' : ' + display[:ip]
      @f.puts 'Country'.ljust(9) + " : #{coloured(display[:country], 'red')}"
      @f.puts

      ################### Short list
      ################### Basically Output Brief

      brief_results = []
      results.each do |plugin_name, plugin_results|
        next if %w(Title IP Country).include? plugin_name

        next if plugin_results.empty?
        suj = suj(plugin_results)

        certainty = suj[:certainty].to_i
        version = suj[:version]
        os = suj[:os]
        string = suj[:string]
        accounts = suj[:account]
        model = suj[:model]
        firmware = suj[:firmware]
        modules = suj[:module]
        filepath = suj[:filepath]

        # colour the output
        # be more DRY
        # if plugins have categories or tags this would be better, eg. all hash plugins are grey
        if (@f == STDOUT && $use_colour == 'auto') || ($use_colour == 'always')
          coloured_string = grey(string)
          coloured_string = cyan(string) if plugin_name == 'HTTPServer'
          coloured_string = yellow(string) if plugin_name == 'Title'

          coloured_string = grey(string) if plugin_name == 'MD5'
          coloured_string = grey(string) if plugin_name == 'Header-Hash'
          coloured_string = grey(string) if plugin_name == 'Footer-Hash'
          coloured_string = grey(string) if plugin_name == 'CSS'
          coloured_string = grey(string) if plugin_name == 'Tag-Hash'

          coloured_plugin = white(plugin_name)
          coloured_plugin = grey(plugin_name) if plugin_name == 'MD5'
          coloured_plugin = grey(plugin_name) if plugin_name == 'Header-Hash'
          coloured_plugin = grey(plugin_name) if plugin_name == 'Footer-Hash'
          coloured_plugin = grey(plugin_name) if plugin_name == 'CSS'
          coloured_plugin = grey(plugin_name) if plugin_name == 'Tag-Hash'

          p = ((certainty && certainty < 100) ? "#{grey(Helper::certainty_to_words(certainty))} " : '') +
              coloured_plugin + (!version.empty? ? "[#{green(version)}]" : '') +
              (!os.empty? ? "[#{red(os)}]" : '') +
              (!string.empty? ? "[#{coloured_string}]" : '') +
              (!accounts.empty? ? "[#{cyan(accounts)}]" : '') +
              (!model.empty? ? "[#{dark_green(model)}]" : '') +
              (!firmware.empty? ? "[#{dark_green(firmware)}]" : '') +
              (!filepath.empty? ? "[#{dark_green(filepath)}]" : '') +
              (!modules.empty? ? "[#{magenta(modules)}]" : '')

          brief_results << p
        else
          brief_results << ((certainty && certainty < 100) ? "#{Helper::certainty_to_words(certainty)} " : '') +
                           plugin_name + (!version.empty? ? "[#{version}]" : '') +
                           (!os.empty? ? "[#{os}]" : '') +
                           (!string.empty? ? "[#{string}]" : '') +
                           (!accounts.empty? ? " [#{accounts}]" : '') +
                           (!model.empty? ? "[#{model}]" : '') +
                           (!firmware.empty? ? "[#{firmware}]" : '') +
                           (!filepath.empty? ? "[#{filepath}]" : '') +
                           (!modules.empty? ? "[#{modules}]" : '')
        end
      end

      brief_results_final = brief_results.join(', ')
      @f.puts 'Summary'.ljust(9) + ' : ' + brief_results_final
      @f.puts
      @f.puts 'Detected Plugins:'

      results.sort.each do |plugin_name, plugin_results|
        next if %w(Title IP Country).include?(plugin_name)
        next if plugin_results.empty?
        @f.puts "[ #{coloured(plugin_name, 'white')} ]"
        description = ['']
        if Plugin.registered_plugins[plugin_name].description
          d = Plugin.registered_plugins[plugin_name].description
          description = Helper::word_wrap(d, 60)
        end
        #          @f.puts "\tCategory   : " + Plugin.registered_plugins[plugin_name].category.first unless Plugin.registered_plugins[plugin_name].category.nil?
        @f.puts "\t" + description.first
        description[1..-1].each { |line| @f.puts "\t" + line }
        @f.puts

        top_certainty = suj(plugin_results)[:certainty].to_i
        unless top_certainty == 100
          @f.puts "\t" + 'Certainty'.ljust(13) + ': ' + Helper::certainty_to_words(top_certainty)
        end

        plugin_results.map { |x| sortuniq(x) }.each do |pr|
          if pr[:name]
            name_of_match = pr[:name]
          else
            name_of_match = [pr[:regexp_compiled], pr[:text], pr[:regexp].to_s,
                             pr[:ghdb], pr[:md5], pr[:tagpattern]].compact.join('|')
          end

          pr.each do |key, value|
            next unless [:version, :os, :string, :account, :model,
                         :firmware, :module, :filepath, :url].include?(key)

            next if value.class == Regexp

            if key == :os
              @f.print "\t" + 'OS'.ljust(13) + ': '
            else
              @f.print "\t" + key.to_s.capitalize.ljust(13) + ': '
            end

            c = case key
                when :version then 'green'
                when :string then 'cyan'
                when :certainty then 'grey'
                when :os then 'red'
                when :account then 'cyan'
                when :model then 'dark_green'
                when :firmware then 'dark_green'
                when :module then 'magenta'
                when :filepath then 'dark_green'
                else 'grey'
                end

            if value.is_a?(String)
              @f.print coloured(value.to_s, c)
            elsif value.is_a?(Array)
              @f.print coloured(value.join(',').to_s, c)
            else
              @f.print coloured(value.inspect, c)
            end

            @f.print " (from #{name_of_match})" unless name_of_match.empty?
            unless pr[:certainty] == 100
              @f.print " (Certainty: #{ertainty_to_words pr[:certainty]} )"
            end

            @f.puts
          end

          @f.puts "\t" + coloured(pr.inspect.to_s, 'dark_blue') if $verbose > 1
        end

        if Plugin.registered_plugins[plugin_name].aggressive
          @f.puts "\tAggressive function available (check plugin file or details)."
        end

        if Plugin.registered_plugins[plugin_name].dorks.any?
          @f.puts "\tGoogle Dorks".ljust(13) + ": (#{Plugin.registered_plugins[plugin_name].dorks.size})"
        end

        if Plugin.registered_plugins[plugin_name].website
          @f.puts "\tWebsite".ljust(13) + ": #{Plugin.registered_plugins[plugin_name].website}"
        end

        @f.puts
      end

      @f.puts 'HTTP Headers:'
      target.raw_headers.each_line do |header|
        @f.puts "\t#{header}"
        # pp target.raw_headers
      end
    end
  end
end
