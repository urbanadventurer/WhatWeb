
class LoggingSQL < Logging
  def initialize(f = STDOUT)
    super
    insert_request_config
  end

  def insert_request_config
    # the config doesn't change between targets

    foo = {}
    req_config = {}

    # when this is called by OutputSQL.new there won't be a user-agent set
    # $CUSTOM_HEADERS["User-Agent"] isn't set until after the command option loop
    $CUSTOM_HEADERS['User-Agent'] = $USER_AGENT unless $CUSTOM_HEADERS['User-Agent']

    if $USE_PROXY
      req_config[:proxy] = { proxy_host: $PROXY_HOST, proxy_port: $PROXY_PORT }
      req_config[:proxy][:proxy_user] = $PROXY_USER if $PROXY_USER
    end

    req_config[:headers] = {} unless $CUSTOM_HEADERS.empty?
    $CUSTOM_HEADERS.each do |header_name, header_value|
      req_config[:headers][header_name] = header_value.dup
    end
    foo[:request_config] = req_config

    flatten_elements!(foo)
    # pp foo[:request_config]

    insert = [escape_for_sql(JSON.dump(foo[:request_config]))].join(',')
    query = "INSERT IGNORE INTO request_configs (value) VALUES (#{insert});"
    @f.puts query
    ##
  end

  def flatten_elements!(obj)
    if obj.class == Hash
      obj.each_value { |x| flatten_elements!(x) }
    elsif obj.class == Array
      obj.flatten!
    end
  end

  def escape_for_sql(s)
    s = s.to_s
    "'" + s.gsub("'"){"\\'"} + "'"
  end

  def create_tables
    # Note that you may encounter the error "1709 - Index column size too large. The maximum column size is 767 bytes."
    # when using MySQL <= 5.6 with the innodb engine and the utf8mb4 character set
    #
    # max_hostname_length = 253
    # max_uri_prefix = 10 # covers https://
    # max_url_length = 2048 # old IE limit
    max_target_length = 2048

    # feel free to modify this
    @f.puts 'CREATE TABLE plugins (plugin_id int NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL,PRIMARY KEY (plugin_id), UNIQUE (name));'
    @f.puts "CREATE TABLE targets (target_id int NOT NULL AUTO_INCREMENT, target varchar(#{max_target_length}) NOT NULL, status varchar(10),PRIMARY KEY (target_id), UNIQUE (target, status) );"
    @f.puts 'CREATE TABLE scans (scan_id int NOT NULL AUTO_INCREMENT, config_id INT NOT NULL, plugin_id INT NOT NULL, target_id INT NOT NULL, version varchar(255), os varchar(255), string varchar(1024), account varchar(1024), model varchar(1024), firmware varchar(1024), module varchar(1024), filepath varchar(1024), certainty varchar(10) ,PRIMARY KEY (scan_id));'
    @f.puts 'CREATE TABLE request_configs (config_id int NOT NULL AUTO_INCREMENT, value TEXT NOT NULL, PRIMARY KEY (config_id) );'

    # plugins table
    @f.puts "INSERT INTO plugins (name) VALUES ('Custom-Plugin');"
    @f.puts "INSERT INTO plugins (name) VALUES ('Grep');"

    Plugin.registered_plugins.each do |n, _|
      @f.puts "INSERT INTO plugins (name) VALUES (#{escape_for_sql(n)});"
    end
  end

  def out(target, status, results)
    # nice
    foo = { target: target, http_status: status, plugins: {}, request_config: {} }

    results.each do |plugin_name, plugin_results|
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
      # empty arrays
      thisplugin[:version] = version.empty? ? [] : version
      thisplugin[:os] = os.empty? ? [] : os
      thisplugin[:string] = string.empty? ? [] : string
      thisplugin[:account] = accounts.empty? ? [] : accounts
      thisplugin[:model] = model.empty? ? [] : model
      thisplugin[:firmware] = firmware.empty? ? [] : firmware
      thisplugin[:module] = modules.empty? ? [] : modules
      thisplugin[:filepath] = filepath.empty? ? [] : filepath

      foo[:plugins][plugin_name.to_sym] = thisplugin
    end

    flatten_elements!(foo)

    i_target = escape_for_sql(foo[:target])
    insert = [escape_for_sql(foo[:http_status]), i_target].join(',')
    query = "INSERT IGNORE INTO targets (status,target) VALUES (#{insert});"
    @f.puts query

    foo[:plugins].each do |x|
      plugin_name = escape_for_sql(x.first.to_s)
      insert = [escape_for_sql(x[1][:version].join(',').to_s), escape_for_sql(x[1][:os].join(',').to_s),
                escape_for_sql(x[1][:string].join(',').to_s), escape_for_sql(x[1][:account].join(',').to_s), escape_for_sql(x[1][:model].join(',').to_s),
                escape_for_sql(x[1][:firmware].join(',').to_s), escape_for_sql(x[1][:module].join(',').to_s), escape_for_sql(x[1][:filepath].join(',').to_s),
                escape_for_sql(x[1][:certainty].to_s)].join(',')

      query = "INSERT INTO scans (target_id, config_id, plugin_id, version, os, string, account, model, firmware, module, filepath, certainty) VALUES ( (SELECT target_id from targets WHERE target = #{i_target}),(SELECT MAX(config_id) from request_configs),(SELECT plugin_id from plugins WHERE name = #{plugin_name}), #{insert} );"
      @f.puts query
    end
  end
end
