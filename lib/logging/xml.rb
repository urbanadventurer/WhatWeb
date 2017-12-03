
# XML Output #
# Does anyone use XML output?
# We'd love to hear any suggestions you may have!
# Does it bother you that some types of output are joined by commas
# but other types aren't?
class LoggingXML < Logging
  def initialize(f = STDOUT)
    super
    @substitutions = { '&' => '&amp;', '"' => '&quot;', '<' => '&lt;', '>' => '&gt;' }
    # only output <?xml line if it's a new file or STDOUT
    if @f == STDOUT #|| @f.empty?
      @f.puts '<?xml version="1.0"?><?xml-stylesheet type="text/xml" href="whatweb.xsl"?>'
    end
    @f.puts '<log>'
  end

  def close
    @f.puts '</log>'
    @f.close
  end

  def escape(t)
    text = t.to_s.dup
    # use sort_by so that & is before &quot;, etc.
    @substitutions.sort_by { |a, _| a == '&' ? 0 : 1 }.map { |from, to| text.gsub!(from, to) }

    # Encode all special characters
    # More info: http://www.asciitable.com/
    r = /[^\x20-\x5A\x5E-\x7E]/

    # based on code for CGI.escape
    text.gsub!(r) { |x| "%#{x.unpack('H2' * x.size).join('%').upcase}" }

    text
  end

  def out(target, status, results)
    $semaphore.synchronize do
      @f.puts '<target>'
      @f.puts "\t<uri>#{escape(target)}</uri>"
      @f.puts "\t<http-status>#{escape(status)}</http-status>"

      @f.puts "\t<request-config>"
      @f.puts "\t\t<proxy>" if $USE_PROXY
      @f.puts "\t\t\t<proxy-host>#{escape($PROXY_HOST)}:#{escape($PROXY_PORT)}</proxy-host>" if $PROXY_HOST && $PROXY_PORT
      @f.puts "\t\t\t<proxy-user>#{escape($PROXY_USER)}</proxy-user>" if $PROXY_USER
      @f.puts "\t\t</proxy>" if $USE_PROXY
      $CUSTOM_HEADERS.each do |header_name, header_value|
        @f.puts "\t\t<header>"
        @f.puts "\t\t\t<header-name>#{escape(header_name)}</header-name>"
        @f.puts "\t\t\t<header-value>#{escape(header_value)}</header-value>"
        @f.puts "\t\t</header>"
      end
      @f.puts "\t</request-config>"

      results.each do |plugin_name, plugin_results|
        @f.puts "\t<plugin>"
        @f.puts "\t\t<name>#{escape(plugin_name)}</name>"

        unless plugin_results.empty?
          # important info in brief mode is version, type and ?
          # what's the highest probability for the match?

          certainty = plugin_results.map do |x|
            x[:certainty] unless x[:certainty].class == Regexp
          end.flatten.compact.sort.uniq.last
          version = plugin_results.map do |x|
            x[:version] unless x[:version].class == Regexp
          end.flatten.compact.sort.uniq
          os = plugin_results.map do |x|
            x[:os] unless x[:os].class == Regexp
          end.flatten.compact.sort.uniq
          string = plugin_results.map do |x|
            x[:string] unless x[:string].class == Regexp
          end.flatten.compact.sort.uniq
          model = plugin_results.map do |x|
            x[:model] unless x[:model].class == Regexp
          end.flatten.compact.sort.uniq
          firmware = plugin_results.map do |x|
            x[:firmware] unless x[:firmware].class == Regexp
          end.flatten.compact.sort.uniq
          filepath = plugin_results.map do |x|
            x[:filepath] unless x[:filepath].class == Regexp
          end.flatten.compact.sort.uniq

          account = plugin_results.map do |x|
            x[:account] unless x[:account].class == Regexp
          end.flatten.compact.sort.uniq
          modules = plugin_results.map do |x|
            x[:module] unless x[:module].class == Regexp
          end.flatten.compact.sort.uniq

          # Output results
          @f.puts "\t\t<certainty>#{escape(certainty)}</certainty>" if certainty && certainty < 100
          version.map { |x| @f.puts "\t\t<version>#{escape(x)}</version>" }
          os.map { |x| @f.puts "\t\t<os>#{escape(x)}</os>" }
          string.map { |x| @f.puts "\t\t<string>#{escape(x)}</string>" }
          model.map { |x| @f.puts "\t\t<model>#{escape(x)}</model>" }
          firmware.map { |x| @f.puts "\t\t<firmware>#{escape(x)}</firmware>" }
          filepath.map { |x| @f.puts "\t\t<filepath>#{escape(x)}</filepath>" }
          account.map { |x| @f.puts "\t\t<account>#{escape(x)}</account>" }
          modules.map { |x| @f.puts "\t\t<module>#{escape(x)}</module>" }
        end
        @f.puts "\t</plugin>"
      end
      @f.puts '</target>'
    end
  end
end
