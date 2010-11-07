module PluginSugar
  def def_field(*names)
    class_eval do 
      names.each do |name|
        define_method(name) do |*args|
          case args.size
          when 0 then instance_variable_get("@#{name}")
          else    instance_variable_set("@#{name}", *args)
          end
        end
      end
    end
  end
end

class Plugin
  attr_accessor :base_uri
  @registered_plugins = {}
 
  class << self
    attr_reader :registered_plugins
    private :new
    attr_reader :locked
    @locked=false
  end

  def self.define(name, &block)
    p = new
    p.instance_eval(&block)
    p.startup
    Plugin.registered_plugins[name] = p
  end

  def startup
	# individual plugins can override this
  end

  def shutdown
	# individual plugins can override this
  end

  def lock
  	@locked=true
  end
  
  def unlock
  	@locked=false
  end
  
  def locked?
  	@locked
  end

  def init (body=nil,meta={},cookies=nil,status=nil,base_uri=nil, ip=nil, md5sum=nil, tagpattern=nil)
  	@body=body
  	@meta=meta
  	@cookies=cookies
  	@status=status
  	@base_uri=base_uri
	@md5sum=md5sum
	@tagpattern=tagpattern
	@ip=ip
  end

# execute plugin
  def x
  	# find the regular expressions in the matches array
  	results=[]

	unless @matches.nil?
	  	@matches.map do |match|
			r=[]

			unless match[:regexp_compiled].nil?
				r << match if @body =~ match[:regexp_compiled]
			end

			unless match[:ghdb].nil?
				r << match if match_ghdb(match[:ghdb], @body, @meta, @status, @base_uri)
			end

			unless match[:text].nil?
				r << match if @body.include?(match[:text])
			end

			unless match[:md5].nil?
				r << match if @md5sum == match[:md5]
			end

			unless match[:tagpattern].nil?
				r << match if @tagpattern == match[:tagpattern]
			end

			if !match[:version].nil? and match[:version].class==Regexp
				if regexpmatch = @body =~ match[:regexp_compiled]
					m = match.dup
					m[:version] = regexpmatch[0][match[:regexp_offset]]
					r << m
				end
			end

			# Model
			if !match[:model].nil? and match[:model].class==Regexp
				if regexpmatch = @body =~ match[:regexp_compiled]
					m = match.dup
					m[:model] = regexpmatch[0][match[:regexp_offset]]
					r << m
				end
			end

			# String
			if !match[:string].nil? and match[:string].class==Regexp
				if regexpmatch = @body =~ match[:regexp_compiled]
					m = match.dup
					m[:string] = regexpmatch[0][match[:regexp_offset]]
					r << m
				end
			end

			# Firmware
			if !match[:firmware].nil? and match[:firmware].class==Regexp
				if regexpmatch = @body =~ match[:regexp_compiled]
					m = match.dup
					m[:firmware] = regexpmatch[0][match[:regexp_offset]]
					r << m
				end
			end

			# Filepath
			if !match[:filepath].nil? and match[:filepath].class==Regexp
				if regexpmatch = @body =~ match[:regexp_compiled]
					m = match.dup
					m[:filepath] = regexpmatch[0][match[:regexp_offset]]
					r << m
				end
			end

			# if match requires a URL, only match it if the @baseuri.path is equal to the :url
			results +=r if match[:url].nil? or (!match[:url].nil? and !@base_uri.nil? and match[:url] == @base_uri.path)
		end
	end

	# if the plugin has a passive method, use it
   	results += self.passive if defined? self.passive

	# if the plugin has an aggressive method and we're in aggressive mode, use it
	# or if we're guessing all URLs
	if ($AGGRESSION == 3 and !results.empty?) or ($AGGRESSION == 4)
		results += self.aggressive if defined? self.aggressive	
		
		# if any of our matches have a url then fetch it
		# and check the matches[]		
		# later we can do some caching


		# we have no caching, so we sort the URLs to fetch and only get 1 unique url per plugin. not great..
		unless @matches.nil?
			lastbase_uri=nil
			thisstatus,thisurl,thisbody,thisheaders,thiscookies=nil # this shouldn't be necessary but ruby thinks its a local variable to the if end statement
			@matches.map {|x| x if x[:url]}.compact.sort_by {|x| x[:url] }.map do |match|
				r=[] # temp results

				# this is messy... need a webpage class
				thisbase_uri=URI.join(@base_uri.to_s, match[:url])
				if thisbase_uri != lastbase_uri
					thisstatus,thisurl,thisip,thisbody,thisheaders,thiscookies = open_target( thisbase_uri.to_s) 
				end
				lastbase_uri=thisbase_uri

				if thisbody.nil?
					thismd5sum=nil
					thistagpattern=nil
				else
					thismd5sum=Digest::MD5.hexdigest(thisbody)
					thistagpattern = make_tag_pattern(thisbody)
				end
				
			

				unless match[:regexp_compiled].nil?
					r << match if thisbody =~ match[:regexp_compiled]
				end

				unless match[:ghdb].nil?
					r << match if match_ghdb(match[:ghdb], thisbody, {}, thisstatus, thisbase_uri)
				end

				unless match[:text].nil?
					r << match if thisbody.include?(match[:text])
				end

				unless match[:md5].nil?
					r << match if thismd5sum == match[:md5]
				end

				unless match[:tagpattern].nil?
					r << match if thistagpattern == match[:tagpattern]
				end
		
				if !match[:version].nil? and match[:version].class==Regexp
					if regexpmatch = thisbody =~ match[:regexp_compiled]
						m = match.dup
						m[:version] = regexpmatch[0][match[:regexp_offset]]
						r << m
					end
				end

				if !match[:model].nil? and match[:model].class==Regexp
					if regexpmatch = thisbody =~ match[:regexp_compiled]
						m = match.dup
						m[:model] = regexpmatch[0][match[:regexp_offset]]
						r << m
					end
				end

				if !match[:string].nil? and match[:string].class==Regexp
					if regexpmatch = thisbody =~ match[:regexp_compiled]
						m = match.dup
						m[:string] = regexpmatch[0][match[:regexp_offset]]
						r << m
					end
				end

				if !match[:firmware].nil? and match[:firmware].class==Regexp
					if regexpmatch = thisbody =~ match[:regexp_compiled]
						m = match.dup
						m[:firmware] = regexpmatch[0][match[:regexp_offset]]
						r << m
					end
				end

				if !match[:filepath].nil? and match[:filepath].class==Regexp
					if regexpmatch = thisbody =~ match[:regexp_compiled]
						m = match.dup
						m[:filepath] = regexpmatch[0][match[:regexp_offset]]
						r << m
					end
				end

				results +=r						
			end
		end
#=end
		
		#puts "."
		# if the plugin has extra URLs then use them if aggressive		
		# we're obviously in the business of guessing URLs now
		#pp @extra_urls

		# this is broken

		unless @extra_urls.nil?		
			#puts "extra_urls, not nil"
			@extra_urls.map do |x|
			
				#pp Thread.main["targets"]
				target = URI.join(@base_uri.to_s,x).to_s
				Thread.main["targets"] << target
				#puts "added #{target}"
				#pp Thread.main["targets"]
			end
		end

	end
	
	# clean up results
	unless results.empty?
		results.each do |r|

			if !r[:string].nil?
				if r[:string].is_a?(String)
					r[:string].delete!("\n\x0d\x09\x0a")
					r[:string].strip!
				end	
			end
			r [:certainty]=100 if r[:certainty].nil?
		end
	end


	
	# check for CVE stuff

		# if has CVE array
			# get final version. just use longest version for now, eg. 3.0.15 over 3.0
				# for each CVE version / version range
					# does version fit thisversion?
						# match CVE
	unless results.empty?
		if defined?(self.vulnerabilities)
			v=self.vulnerabilities(results)
			pp v
		end
	end
	# take CVE version, split into comma delimited list
	# for each
	# it's a range if it has - or x
	# is it in the range?


	# examples
	# ["2.1.0-2.1.8, 2.2.0-2.2.8, 2.3.0-2.3.4, 2.4.0-2.4.6"
	# "2.0.x"
	# "1.81-"
	# "3.1"


	results
  end

  extend PluginSugar
  def_field :author, :version, :examples, :description, :matches, :cve, :extra_urls
end


