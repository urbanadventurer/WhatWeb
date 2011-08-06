class Target
	attr_accessor :target

	attr_accessor :url, :status, :ip, :body, :headers, :raw_headers, :raw_response

	attr_accessor :cookiejar

	attr_accessor :md5sum
	attr_accessor :tag_pattern

	attr_accessor :is_url, :is_file
	# add persistent cookies

	def inspect
		"#{target} " + [@uri,@status,@ip,@body,@headers,@raw_headers,@raw_response,@cookie_jar,@md5sum,@tag_pattern,@is_url,@is_file].join(",")
	end

	def to_s
		@target
	end

	def is_file?
		@is_file
	end

	def is_url?
		@is_url
	end

	def initialize(target=nil)
		@target=target

		if @target =~ /^http[s]?:\/\//
			@is_url=true 
		else
			@is_url=false
		end

		if File.exists?(@target)
			@is_file=true
			if File.directory?(@target)
				raise "Error: #{@target} is a directory"
			end
			if File.readable?(@target) == false
				raise "Error: You do not have permission to view #{@target}"
			end
		else
			@is_file=false
		end
	end

	def open
		if self.is_file?
			open_file
		else
			open_url
		end

		## after open 
		if @body.nil?
			# Initialize @body variable if the connection is terminated prematurely
			# This is usually caused by HTTP status codes: 101, 102, 204, 205, 305
			@body=""
		else
			@md5sum=Digest::MD5.hexdigest(@body)
			@tag_pattern = make_tag_pattern(@body)
		end
	end


	def open_file
		# target is a file
		@body=File.open(@target).read

		# target is a http packet file
		if @body =~ /^HTTP\/1\.\d [\d]{3} (.+)\r\n\r\n/m
			# extract http header
			@headers=Hash.new
			pageheaders = body.to_s.split(/\r\n\r\n/).first.to_s.split(/\r\n/)
			@status = pageheaders.first.scan(/^HTTP\/1\.\d ([\d]{3}) /)
			@cookies=[]
			for k in 1...pageheaders.length
				section=pageheaders[k].split(/:/).first.to_s.downcase
				if section =~ /^set-cookie$/i
					@cookies << pageheaders[k].scan(/:[\s]*(.+)$/).to_s
				else
					@headers[section]=pageheaders[k].scan(/:[\s]*(.+)$/).to_s
				end
			end
			@headers["set-cookie"] = cookies.join("\n") unless cookies.nil? or cookies.empty?

			# extract html source
			if @body =~ /^HTTP\/1\.\d [\d]{3} .+?\r\n\r\n(.+)/m
				@body = @body.scan(/^HTTP\/1\.\d [\d]{3} .+?\r\n\r\n(.+)/m).to_s
			else
				@body = ""
			end
		end
	end

	def open_url
		@status,@url,@ip,@body,@headers,@raw_headers = open_target(@target.to_s)
	end
end

