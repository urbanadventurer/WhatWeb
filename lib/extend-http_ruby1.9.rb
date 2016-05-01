require 'net/protocol'
require 'uri'
require 'timeout'


#
# 
# added @raw
# added @real_response
#
#

# Modified HTTP to return the real header block
# This *works* with Ruby1.8.7 and Ruby1.9.1

# HTTPS loses SPI

# The ExtendedHTTP class is used in place of the HTTP class
# for example,
# http=ExtendedHTTP.new(@uri.host,@uri.port)

# The ExtendedHTTP class uses the ExtendedHTTPResponse class

class ExtendedHTTP < Net::HTTP   #:nodoc:
   include Net

#  class HTTP < Protocol

    # Creates a new Net::HTTP object for the specified +address+.
    # This method does not open the TCP connection.
    #
    # ExtendedHTTP :: initialize
    # added @raw=[]

    def initialize(address, port = nil)
      @address = address
      @port    = (port || HTTP.default_port)
      @curr_http_version = HTTPVersion
      @no_keepalive_server = false
      @close_on_empty_response = false
      @socket  = nil
      @started = false
      @open_timeout = nil
      @read_timeout = 60
      @continue_timeout = nil
      @debug_output = nil
      @use_ssl = false
      @ssl_context = nil
      @enable_post_connection_check = true
      @compression = nil
      @sspi_enabled = false

      #$DEBUG=true
      
      if defined?(SSL_ATTRIBUTES)
        SSL_ATTRIBUTES.each do |name|
          instance_variable_set "@#{name}", nil
        end
      end

      # added for whatweb
	  @raw = []
    end

	# ExtendedHTTP :: raw
	# added def raw
    def raw
	     @raw
    end
	
	# ExtendedHTTP :: raw
	# added @raw
    def connect
      D "opening connection to #{conn_address()}..."
      s = timeout(@open_timeout) { TCPSocket.open(conn_address(), conn_port()) }
      D "opened"
      if use_ssl?
        ssl_parameters = Hash.new
        iv_list = instance_variables
        SSL_ATTRIBUTES.each do |name|
          ivname = "@#{name}".intern
          if iv_list.include?(ivname) and
             value = instance_variable_get(ivname)
            ssl_parameters[name] = value
          end
        end
        @ssl_context = OpenSSL::SSL::SSLContext.new      
        @ssl_context.set_params(ssl_parameters)

        s = OpenSSL::SSL::SSLSocket.new(s, @ssl_context)
        s.sync_close = true
      end
      @socket = BufferedIO.new(s)
      @socket.read_timeout = @read_timeout
      @socket.continue_timeout = @continue_timeout
      @socket.debug_output = @debug_output

      if use_ssl?
        begin
          if proxy?
            @socket.writeline sprintf('CONNECT %s:%s HTTP/%s',
                                      @address, @port, HTTPVersion)
            @socket.writeline "Host: #{@address}:#{@port}"
            if proxy_user
              credential = ["#{proxy_user}:#{proxy_pass}"].pack('m')
              credential.delete!("\r\n")
              @socket.writeline "Proxy-Authorization: Basic #{credential}"
            end
            @socket.writeline ''

            # whatweb
            # HTTPResponse.read_new(@socket).value            
    		  	x,raw = ExtendedHTTPResponse.read_new(@socket)
    		  	@raw = raw
    		  	res = x.value

          end
          # Server Name Indication (SNI) RFC 3546
          s.hostname = @address if s.respond_to? :hostname=          
          timeout(@open_timeout) { s.connect }
          if @ssl_context.verify_mode != OpenSSL::SSL::VERIFY_NONE            
            s.post_connection_check(@address)
          end
        rescue => exception
          D "Conn close because of connect error #{exception}"
          @socket.close if @socket and not @socket.closed?
          raise exception
        end
      end
      on_connect      
    end
    private :connect




    def transport_request(req)
      begin_transport req
      res = catch(:response) {
        req.exec @socket, @curr_http_version, edit_path(req.path)
        begin
            # added for whatweb
            #res = HTTPResponse.read_new(@socket)
            res, y = ExtendedHTTPResponse.read_new(@socket)
	  		@raw << y
	  		#
        end while res.kind_of?(HTTPContinue)
        res.reading_body(@socket, req.response_body_permitted?) {
          yield res if block_given?
        }
        res
      }
      end_transport req, res
      res
    rescue => exception
      D "Conn close because of error #{exception}"
      @socket.close if @socket and not @socket.closed?
      raise exception
    end


end


#	added @raw
 class ExtendedHTTPResponse < Net::HTTPResponse # reopen
	include Net

    class << self

	  # read_new and read_status_line are copied from ruby 2
      def read_new(sock)   #:nodoc: internal use only
        x,httpv, code, msg = read_status_line(sock)
		@rawlines= x + "\n"
        res = response_class(code).new(httpv, code, msg)
        each_response_header(sock) do |k,v|
          res.add_field k, v
        end
		    # added for whatweb
		    real = @rawlines
        #pp real
        [res,real]
      end

      private

      def read_status_line(sock)
        str = sock.readline
        m = /\AHTTP(?:\/(\d+\.\d+))?\s+(\d\d\d)\s*(.*)\z/in.match(str) or
          raise HTTPBadResponse, "wrong status line: #{str.dump}"
        [str] + m.captures
      end


      def each_response_header(sock)
        key = value = nil
        while true
          line = sock.readuntil("\n", true).sub(/\s+\z/, '')
 	        # added for whatweb
	        @rawlines << line + "\n" unless line.nil?
	        #

          break if line.empty?
          if line[0] == ?\s or line[0] == ?\t and value
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

    public

    def initialize(httpv, code, msg)   #:nodoc: internal use only
      @http_version = httpv
      @code         = code
      @message      = msg
      initialize_http_header nil
      @body = nil
      @read = false

      # whatweb
      @realresponse=[]
      @rawlines=""
    end

end



