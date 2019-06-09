
# MagicTree #
# Output XML file in MagicTree XML format
class LoggingMagicTreeXML < Logging
  def initialize(f = STDOUT)
    super
    @substitutions = { '&' => '&amp;', '"' => '&quot;', '<' => '&lt;', '>' => '&gt;' }

    # only output <?xml line if it's a new file or STDOUT
    @f.puts '<?xml version="1.0" encoding="UTF-8"?>' if @f.empty?
    @f.puts '<magictree class="MtBranchObject">'
  end

  def close
    @f.puts '</magictree>'
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

  def out(target, _status, results)
    $semaphore.synchronize do
      # Parse target URL and initialize host node details
      uri = URI.parse(target.to_s)
      @host_os = []
      @host_port = uri.port
      @host_scheme = uri.scheme

      # Set host node details
      if uri.host =~ /^[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}$/i
        @host_ip = uri.host
        @host_name = nil
      else
        @host_name = uri.host
        @host_ip = nil
      end

      # Loop through plugin results # get host IP, country and OS
      results.each do |plugin_name, plugin_results|
        next if plugin_results.empty?
        # Host IP
        @host_ip = plugin_results.map { |x| x[:string] unless x[:string].nil? }.to_s if plugin_name =~ /^IP$/
        # Host Country
        @host_country = plugin_results.map { |x| x[:string] unless x[:string].nil? }.to_s if plugin_name =~ /^Country$/
        # Host OS
        @host_os << plugin_results.map { |x| x[:os] unless x[:os].class == Regexp }.to_s
      end

      # testdata branch
      @f.write "<testdata class=\"MtBranchObject\"><host>#{escape(@host_ip)}"

      # hostname
      @f.write "<hostname>#{escape(@host_name)}</hostname>" unless @host_name.nil?

      # os
      @host_os.compact.sort.uniq.map { |x| @f.write "<os>#{escape(x.to_s)}</os>" unless x.empty? } unless @host_os.empty?

      # country and port nodes
      @f.write "<country>#{escape(@host_country)}</country><ipproto>tcp<port>#{escape(@host_port)}<state>open</state>"

      # https
      @f.write '<tunnel>ssl' if @host_scheme == 'https'

      # Service node # Loop through remaining results
      # software, headers, firmware, modules, etc. are all related to a specific URL and therefore are placed under the url node
      @f.puts '<service>http'
      results.each do |plugin_name, plugin_results|
        next unless !plugin_results.empty? && plugin_name !~ /^IP$/ && plugin_name !~ /^Country$/
        certainty = plugin_results.map { |x| x[:certainty] unless x[:certainty].class == Regexp }.flatten.compact.sort.uniq.last
        versions = plugin_results.map { |x| x[:version] unless x[:version].class == Regexp }.flatten.compact.sort.uniq
        strings = plugin_results.map { |x| x[:string] unless x[:string].class == Regexp }.flatten.compact.sort.uniq
        models = plugin_results.map { |x| x[:model] unless x[:model].class == Regexp }.flatten.compact.sort.uniq
        firmwares = plugin_results.map { |x| x[:firmware] unless x[:firmware].class == Regexp }.flatten.compact.sort.uniq
        filepaths = plugin_results.map { |x| x[:filepath] unless x[:filepath].class == Regexp }.flatten.compact.sort.uniq
        accounts = plugin_results.map { |x| x[:account] unless x[:account].class == Regexp }.flatten.compact.sort.uniq
        modules = plugin_results.map { |x| x[:module] unless x[:module].class == Regexp }.flatten.compact.sort.uniq

        # URL node # plugin node
        @f.write "<url>#{escape(target)}<#{escape(plugin_name)}>"

        # Print certainty if certainty < 100
        if certainty && certainty < 100
          @f.write "<certainty>#{escape(certainty)}</certainty>"
        end

        # Strings
        unless strings.empty?
          strings.map { |x| @f.write escape(x).to_s } unless plugin_name =~ /^IP$/ || plugin_name =~ /^Country$/
        end

        # Versions
        unless versions.empty?
          versions.map { |x| @f.write "<version>#{escape(x)}</version>" }
        end

        # Models
        unless models.empty?
          models.map { |x| @f.puts "<model>#{escape(x)}</model>" }
        end

        # Firmware
        unless firmwares.empty?
          firmwares.map { |x| @f.write "<firmware>#{escape(x)}</firmware>" }
        end

        # Modules
        unless modules.empty?
          modules.map { |x| @f.write "<module>#{escape(x)}</module>" } unless plugin_name =~ /^Country$/
        end

        # Accounts # MagicTree generally uses "user" nodes for account
        unless accounts.empty?
          accounts.map { |x| @f.write "<user>#{escape(x)}</user>" }
        end

        # Local File Filepaths # Not to be confused with file paths in the web root which are returned in Strings
        unless filepaths.empty?
          filepaths.map { |x| @f.write "<filepath>#{escape(x)}</filepath>" }
        end

        # debug node # Uncomment to debug
        # @f.write "<debug title=\"WhatWeb\" class=\"MtTextObject\">Identifying: #{escape(target)}\nHTTP-Status: #{escape(status)}"
        # @f.write "#{escape(results.pretty_inspect)}" unless results.empty?
        # @f.write "</debug>"

        # Close plugin name and URL nodes
        @f.write "</#{escape(plugin_name)}></url>"
      end
      @f.write '</service>'
      # end https node
      @f.write '</tunnel>' if @host_scheme == 'https'
      # testdata # close port, host and testdata nodes
      @f.write '</port></ipproto></host></testdata>'
    end
  end
end
