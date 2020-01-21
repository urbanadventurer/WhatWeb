
# JSON Output #
class LoggingJSON < Logging
  def initialize(f = STDOUT)
    super
    @is_first_log_entry = true
    # opening bracket
    @f.puts '['
  end

  def close
    # closing bracket
    @f.puts ']'
    @f.close
  end

  def flatten_elements!(obj)
    if obj.class == Hash
      obj.each_value do |x|
        flatten_elements!(x)
      end
    end

    obj.flatten! if obj.class == Array
  end

  def out(target, status, results)
    # nice

    foo = { target: target.to_s, http_status: status, request_config: {}, plugins: {} }

    # request-config
    req_config = {}
    if $USE_PROXY
      req_config[:proxy] = { proxy_host: $PROXY_HOST, proxy_port: $PROXY_PORT }
      req_config[:proxy][:proxy_user] = $PROXY_USER if $PROXY_USER
    end

    req_config[:headers] = {} unless $CUSTOM_HEADERS.empty?
    $CUSTOM_HEADERS.each do |header_name, header_value|
      req_config[:headers][header_name] = header_value.dup
    end
    foo[:request_config] = req_config

    # plugins

    results.each do |plugin_name, plugin_results|
      #      thisplugin = {name: plugin_name}
      thisplugin = {}

      next if plugin_results.empty?
      # important info in brief mode is version, type and ?
      # what's the highest probability for the match?

      certainty = plugin_results.map { |x| x[:certainty] unless x[:certainty].class == Regexp }.flatten.compact.sort.uniq.last

      version = plugin_results.map { |x| x[:version] unless x[:version].class == Regexp }.flatten.compact.sort.uniq
      os = plugin_results.map { |x| x[:os] unless x[:os].class == Regexp }.flatten.compact.sort.uniq
      string = plugin_results.map { |x| x[:string] unless x[:string].class == Regexp }.flatten.compact.sort.uniq
      accounts = plugin_results.map { |x| x[:account] unless x[:account].class == Regexp }.flatten.compact.sort.uniq
      model = plugin_results.map { |x| x[:model] unless x[:model].class == Regexp }.flatten.compact.sort.uniq
      firmware = plugin_results.map { |x| x[:firmware] unless x[:firmware].class == Regexp }.flatten.compact.sort.uniq
      modules = plugin_results.map { |x| x[:module] unless x[:module].class == Regexp }.flatten.compact.sort.uniq
      filepath = plugin_results.map { |x| x[:filepath] unless x[:filepath].class == Regexp }.flatten.compact.sort.uniq

      thisplugin[:certainty] = certainty if !certainty.nil? && certainty != 100

      thisplugin[:version] = version unless version.empty?
      thisplugin[:os] = os unless os.empty?
      thisplugin[:string] = string unless string.empty?
      thisplugin[:account] = accounts unless accounts.empty?
      thisplugin[:model] = model unless model.empty?
      thisplugin[:firmware] = firmware unless firmware.empty?
      thisplugin[:module] = modules unless modules.empty?
      thisplugin[:filepath] = filepath unless filepath.empty?
      #        foo[:plugins] << thisplugin
      foo[:plugins][plugin_name.to_sym] = thisplugin
    end

    @charset = results.map { |n, r| r[0][:string] if n == 'Charset' }.compact.first

    if @charset.nil? || @charset == 'Failed'
      # could not find encoding force UTF-8 anyway
      Helper::utf8_elements!(foo)
    else
      Helper::utf8_elements!(foo) # convert foo to utf-8
      flatten_elements!(foo)
    end

    $semaphore.synchronize do
      unless @is_first_log_entry
        @f.puts ","
      else
        @is_first_log_entry = false
      end

      @f.puts JSON.generate(foo)
    end
  end
end
