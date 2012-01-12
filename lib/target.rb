module WhatWeb
class Target
	attr_reader :target
	attr_reader :status, :ip, :body, :headers, :raw_headers, :raw_response
  attr_accessor :uri
	attr_reader :cookies
	attr_reader :md5sum
	attr_reader :tag_pattern
	attr_accessor :original_source
  attr_accessor :is_url, :is_file
	attr_accessor :http_options

	@@meta_refresh_regex=/<meta[\s]+http\-equiv[\s]*=[\s]*['"]?refresh['"]?[^>]+content[\s]*=[^>]*[0-9]+;[\s]*url=['"]?([^"'>]+)['"]?[^>]*>/i


	def inspect
		"#{target} " + [@uri,@status,@ip,@body,@headers,@raw_headers,@raw_response,@cookies,@md5sum,@tag_pattern,@is_url,@is_file].join(",")
	end

	def to_s
		original_source
	end

	def Target.meta_refresh_regex
		@@meta_refresh_regex
	end
	def is_file?
		@is_file
	end

	def is_url?
		@is_url
	end

	def initialize(target=nil)
		@target=target
		@headers={}
    open_string(target)
    @md5sum=Digest::MD5.hexdigest(@body)
		@tag_pattern = make_tag_pattern(@body)

  end


# fuzzy matching ftw
def make_tag_pattern(b)
	# remove stuff between script and /script
	# don't bother with  !--, --> or noscript and /noscript
	inscript=false;

	b.scan(/<([^\s>]*)/).flatten.map {|x| x.downcase!; r=nil;
			r=x if inscript==false
			inscript=true if x=="script"
			(inscript=false; r=x) if x=="/script"
			r
		}.compact.join(",")
end

	def open_string(string)
		# target is a file
	  @body=string.force_encoding("BINARY")
		# target is a http packet file
		if @body =~ /^HTTP\/1\.\d [\d]{3} (.+)\r\n\r\n/m
			# extract http header
			@headers=Hash.new	
			pageheaders = body.to_s.split(/\r\n\r\n/).first.to_s.split(/\r\n/)
			@raw_headers = pageheaders.join("\n") + "\r\n\r\n"
			@status = pageheaders.first.scan(/^HTTP\/1\.\d ([\d]{3}) /).flatten.first.to_i
			@cookies=[]
			for k in 1...pageheaders.length
				section=pageheaders[k].split(/:/).first.to_s.downcase
        if section =~ /^set-cookie$/i
					@cookies << pageheaders[k].scan(/:[\s]*(.+)$/).flatten.first
				else
					@headers[section]=pageheaders[k].scan(/:[\s]*(.+)$/).flatten.first
				end
			end
			@headers["set-cookie"] = @cookies.join("\n") unless @cookies.nil? or @cookies.empty?

			# extract html source
			if @body =~ /^HTTP\/1\.\d [\d]{3} .+?\r\n\r\n(.+)/m
				@body = @body.scan(/^HTTP\/1\.\d [\d]{3} .+?\r\n\r\n(.+)/m).to_s
			end
		end
	end

	def get_redirection_target
		newtarget_m=nil
		newtarget_h=nil
		newtarget=nil			

		if @@meta_refresh_regex =~ @body
			metarefresh=@body.scan(@@meta_refresh_regex).flatten.first
			metarefresh=decode_html_entities(metarefresh)
			newtarget_m=URI.join(@target,metarefresh).to_s # this works for relative and absolute
		end

		unless @status.nil? or @headers.nil?
			newtarget_h=URI.join(@target,@headers["location"]).to_s if (300..399) === @status and @headers["location"]
		end

		# if both meta refresh location and HTTP location are set, then the HTTP location overrides
		if newtarget_m or newtarget_h
			case $FOLLOW_REDIRECT
			when "never"
				no_redirects=true # this never gets back to main loop but no prob
			when "http-only"
				newtarget = newtarget_h
			when "meta-only"
				newtarget = newtarget_m
			when "same-site"
				newtarget = (newtarget_h or newtarget_m) if URI.parse((newtarget_h or newtarget_m)).host == @uri.host # defaults to _h if both are present
			when "same-domain"
				newtarget = (newtarget_h or newtarget_m) if TLD.same_domain?(
					@uri.host, URI.parse((newtarget_h or newtarget_m)).host)
			when "always"
				newtarget = (newtarget_h or newtarget_m)
			else
				error("Error: Invalid REDIRECT mode")
			end
		end
		newtarget=nil if newtarget == @uri.to_s # circular redirection not allowed

		newtarget
	end

end
end
