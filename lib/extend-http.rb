require 'net/protocol'
require 'uri'
require 'timeout'

# This works with Ruby 2.x. Based on HTTP library from Ruby 2.2.3p173
# Modified to return the HTTP headers as a string
# added @raw
# added @raw_lines
#
#

# The ExtendedHTTP class is used in place of the HTTP class
# for example,
# http=ExtendedHTTP.new(@uri.host,@uri.port)
# The ExtendedHTTP class uses the ExtendedHTTPResponse class

class ExtendedHTTP < Net::HTTP #:nodoc:
  include Net
  
  SSL_ATTRIBUTES = [ :verify_mode ]

  # Creates a new Net::HTTP object for the specified server address,
  # without opening the TCP connection or initializing the HTTP session.
  # The +address+ should be a DNS hostname or IP address.
  def initialize(address, port = nil)

    @address = address
    @port    = (port || HTTP.default_port)

    @curr_http_version = HTTPVersion
    @keep_alive_timeout = 2
    @last_communicated = nil
    @close_on_empty_response = false
    @socket  = nil
    @started = false
    @open_timeout = nil
    @read_timeout = 60
    @continue_timeout = nil
    @debug_output = nil

    @proxy_from_env = false
    @proxy_uri      = nil
    @proxy_address  = nil
    @proxy_port     = nil
    @proxy_user     = nil
    @proxy_pass     = nil

    @use_ssl = false
    @ssl_context = nil
    @ssl_session = nil
    @enable_post_connection_check = true
    @sspi_enabled = false

    SSL_IVNAMES.each do |ivname|
      instance_variable_set ivname, nil
    end

    # added for whatweb
    @raw = []
  end

  # ExtendedHTTP :: raw
  # added for whatweb
  attr_reader :raw

  # added @raw for whatweb
  def connect
    @raw = []
    if proxy?
      conn_address = proxy_address
      conn_port    = proxy_port
    else
      conn_address = address
      conn_port    = port
    end

    D "opening connection to #{conn_address}:#{conn_port}..."
    s = Timeout.timeout(@open_timeout, Net::OpenTimeout) do
      TCPSocket.open(conn_address, conn_port, @local_host, @local_port)
     # TCPSocket.open(conn_address, conn_port, '127.0.0.1', '11111')

    end
    s.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
    D 'opened'

    if use_ssl?
      @ssl_context = OpenSSL::SSL::SSLContext.new

      # Set SSL options for maximum compatibility with all servers
      @ssl_context.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      # Configure SSL context for maximum compatibility with ALL protocols
      begin
        # First try to enable all protocols by removing restrictions
        if @ssl_context.respond_to?(:ssl_version=)
          # SSLv23_method allows for negotiation of ANY supported SSL/TLS version
          # including SSLv2, SSLv3, TLS 1.0, and up if available
          @ssl_context.ssl_version = :SSLv23_method rescue nil
          
          # Fall back to TLS_method if SSLv23_method isn't available
          @ssl_context.ssl_version = :TLS_method rescue nil
        end
        
        # Clear any minimum version restrictions to allow legacy protocols
        if @ssl_context.respond_to?(:min_version=)
          begin
            # Set to lowest possible to allow SSLv2/SSLv3 where available
            @ssl_context.min_version = 0
          rescue
            # Some Ruby versions may have different ways to handle this
            # Try alternate approach for legacy support
            if defined?(OpenSSL::SSL::SSL2_VERSION)
              @ssl_context.min_version = OpenSSL::SSL::SSL2_VERSION rescue nil
            elsif defined?(OpenSSL::SSL::SSL3_VERSION)
              @ssl_context.min_version = OpenSSL::SSL::SSL3_VERSION rescue nil
            end
          end
        end
        
        # Try to explicitly enable SSLv2 and SSLv3 through options if available
        @ssl_context.options &= ~OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
        @ssl_context.options &= ~OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
        @ssl_context.options &= ~OpenSSL::SSL::OP_NO_TLSv1 if defined?(OpenSSL::SSL::OP_NO_TLSv1)
      rescue => e
        # Ignore errors from unsupported SSL options
      end


#      pry.binding
      

      D "starting SSL for #{conn_address}:#{conn_port}..."
      s = OpenSSL::SSL::SSLSocket.new(s, @ssl_context)
      s.sync_close = true
      D 'SSL established'
    end

    @socket = BufferedIO.new(s)
    @socket.read_timeout = @read_timeout
    @socket.continue_timeout = @continue_timeout
    @socket.debug_output = @debug_output
    if use_ssl?
      begin
        if proxy?
          buf = "CONNECT #{@address}:#{@port} HTTP/#{HTTPVersion}\r\n"
          buf << "Host: #{@address}:#{@port}\r\n"

          if proxy_user
            credential = ["#{proxy_user}:#{proxy_pass}"].pack('m')
            credential.delete!("\r\n")
            buf << "Proxy-Authorization: Basic #{credential}\r\n"
          end

          buf << "\r\n"
          @socket.write(buf)

          # HTTPResponse.read_new(@socket).value
          # added this
          _x, raw = ExtendedHTTPResponse.read_new(@socket)
          @raw << raw
          # res = x.value
          #
        end

        if @ssl_session &&
           Process.clock_gettime(Process::CLOCK_REALTIME) < @ssl_session.time.to_f + @ssl_session.timeout
          s.session = @ssl_session if @ssl_session
        end

        # Server Name Indication (SNI) RFC 3546
        s.hostname = @address if s.respond_to? :hostname=
        Timeout.timeout(@open_timeout, Net::OpenTimeout) { s.connect }
        if @ssl_context.verify_mode != OpenSSL::SSL::VERIFY_NONE
          s.post_connection_check(@address)
        end

        @ssl_session = s.session
      rescue => exception
        D "Conn close because of connect error #{exception}"
        @socket.close if @socket && !@socket.closed?
        raise exception
      end
    end

    on_connect
  end

  private :connect

  def transport_request(req)
    count = 0
    begin
      begin_transport req
      res = catch(:response) do
        req.exec @socket, @curr_http_version, edit_path(req.path)
        begin

          # added for whatweb
          # res = HTTPResponse.read_new(@socket)
          res, y = ExtendedHTTPResponse.read_new(@socket)
          @raw << y
          #
          res.decode_content = req.decode_content
        end while res.is_a?(HTTPContinue)

        res.uri = req.uri

        res.reading_body(@socket, req.response_body_permitted?) do
          yield res if block_given?
        end
        res
      end
    rescue Net::OpenTimeout
      raise
    rescue Net::ReadTimeout, IOError, EOFError,
           Errno::ECONNRESET, Errno::ECONNABORTED, Errno::EPIPE,
           # avoid a dependency on OpenSSL
           defined?(OpenSSL::SSL) ? OpenSSL::SSL::SSLError : IOError,
           Timeout::Error => exception
      if count == 0 && IDEMPOTENT_METHODS_.include?(req.method)
        count += 1
        @socket.close if @socket && !@socket.closed?
        D "Conn close because of error #{exception}, and retry"
        retry
      end
      D "Conn close because of error #{exception}"
      @socket.close if @socket && !@socket.closed?
      raise
    end

    end_transport req, res
    res
  rescue => exception
    D "Conn close because of error #{exception}"
    @socket.close if @socket && !@socket.closed?
    raise exception
  end
end

#  added @raw
class ExtendedHTTPResponse < Net::HTTPResponse # reopen
  include Net

  class << self
  def read_new(sock) #:nodoc: internal use only
    x, httpv, code, msg = read_status_line(sock)
    @rawlines = x + "\n"
    res = response_class(code).new(httpv, code, msg)
    each_response_header(sock) do |k, v|
      res.add_field k, v
    end
    # added for whatweb
    real = @rawlines
    [res, real]
  end

    private

  def read_status_line(sock)
    str = sock.readline
    (m = /\AHTTP(?:\/(\d+\.\d+))?\s+(\d\d\d)\s*(.*)\z/in.match(str)) ||
      raise(HTTPBadResponse, "wrong status line: #{str.dump}")
    [str] + m.captures
  end

  def each_response_header(sock)
    key = value = nil
    loop do
      line = sock.readuntil("\n", true).sub(/\s+\z/, '')
      # added for whatweb
      @rawlines << line + "\n" unless line.nil?
      #
      break if line.empty?

      if line[0] == ' ' || line[0] == "\t" && value
        value << ' ' unless value.empty?
        value << line.strip
      else
        yield key, value if key
        key, value = line.strip.split(/\s*:\s*/, 2)
        raise Net::HTTPBadResponse, 'wrong header line format' if value.nil?
      end
    end
    yield key, value if key
  end
  end

  ###################

  public

  #    include HTTPHeader

  def initialize(httpv, code, msg) #:nodoc: internal use only
    @http_version = httpv
    @code         = code
    @message      = msg
    initialize_http_header nil
    @body = nil
    @read = false
    @uri  = nil
    @decode_content = false

    # added for whatweb
    @rawlines = ''
  end
end
