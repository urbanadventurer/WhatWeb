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

  def version_detection?
	r=false
	if @matches and !@matches.empty?
		if !@matches.map {|m| m[:version] }.compact.empty?
			r=true
		end
	end
	r
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

  def init (target)
  	@body=target.body
  	@meta=target.headers
  	@status=target.status
  	@base_uri=target.uri
	@md5sum=target.md5sum
	@tagpattern=target.tag_pattern
	@ip=target.ip
  end

# execute plugin
  def x	
  	results=[]
	
	unless @matches.nil?
	  	@matches.each do |match|
			r=[]

			unless match[:ghdb].nil?
				r << match if match_ghdb(match[:ghdb], @body, @meta, @status, @base_uri)
			end
			
			unless match[:text].nil?
				#r << match if @body.include?(match[:text])
				r << match if match[:regexp_compiled] =~ @body
			end

			unless match[:md5].nil?
				r << match if @md5sum == match[:md5]
			end

			unless match[:tagpattern].nil?
				r << match if @tagpattern == match[:tagpattern]
			end


			if !match[:status].nil? and match[:url] == @base_uri.path
				r << match if @status == match[:status]
			end

			unless match[:regexp_compiled].nil?
				[:regexp,:account,:version,:os,:module,:model,:string,:firmware,:filepath].each do |symbol|
					if !match[symbol].nil? and match[symbol].class==Regexp
						regexpmatch = @body.scan(match[:regexp_compiled])
				                unless regexpmatch.empty?
				                        m = match.dup
				                        m[symbol] = regexpmatch.map {|eachmatch|
									if match[:offset]
										eachmatch[match[:offset]]
									else
										eachmatch.first
									end
								}.flatten.sort.uniq
				                        r << m
				                end
					end
				end
			end

			# if match requires a URL, only match it if the @baseuri.path is equal to the :url
			# if :status is present then check that @status matches
			if match[:url].nil? or (!match[:url].nil? and !@base_uri.nil? and match[:url] == @base_uri.path)
				if match[:status].nil? or (!match[:status].nil? and @status == match[:status] and !match[:url].nil?)					
					results +=r 
				end
			end
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
			thisstatus,thisurl,thisbody,thisheaders=nil # this shouldn't be necessary but ruby thinks its a local variable to the if end statement
			@matches.map {|x| x if x[:url]}.compact.sort_by {|x| x[:url] }.map do |match|
				r=[] # temp results

				# this is messy... need a webpage class
				thisbase_uri=URI.join(@base_uri.to_s, match[:url])
				if thisbase_uri != lastbase_uri
					thisstatus,thisurl,thisip,thisbody,thisheaders = open_target( thisbase_uri.to_s) 
				end
				lastbase_uri=thisbase_uri

				if thisbody.nil?
					thismd5sum=nil
					thistagpattern=nil
				else
					thismd5sum=Digest::MD5.hexdigest(thisbody)
					thistagpattern = make_tag_pattern(thisbody)
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
		
				if !match[:status].nil? and match[:url] == thisbase_uri.path
					r << match if thisstatus == match[:status]
				end

				unless match[:regexp_compiled].nil?
					[:regexp, :account,:version,:os,:module,:model,:string,:firmware,:filepath].each do |symbol|
						if !match[symbol].nil? and match[symbol].class==Regexp
							regexpmatch = thisbody.scan(match[:regexp_compiled])
						        unless regexpmatch.empty?
						                m = match.dup
						                m[symbol] = regexpmatch.map {|eachmatch|
										if match[:offset]
											eachmatch[match[:offset]]
										else
											eachmatch.first
										end
									}.flatten.sort.uniq
						                r << m
						        end
						end
					end
				end		

				results +=r					
			end
		end

	end
	
	# clean up results
	unless results.empty?
		results.each do |r|
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
  def_field :author, :version, :examples, :description, :matches, :cve, :dorks
#, :category

end



# this class contains stuff related to plugins but not necessary to repeat in each plugin we create
class PluginSupport

	# this is used by load_plugins
	def PluginSupport.load_plugin(f)
		begin
			load f
		rescue
			error("Error: failed to load #{f}")
		rescue SyntaxError
			error("Error: Failed to load #{f}: syntax error")
		rescue SystemExit, Interrupt
			error("ERROR: Failed to load plugins: Interrupted")
			if $DEBUG==true or $verbose > 1
				raise
			end
			exit 1
		end
	end


	# precompile regular expressions in plugins for performance
	def PluginSupport.precompile_regular_expressions
		Plugin.registered_plugins.each do |thisplugin|
			matches=thisplugin[1].matches
			unless matches.nil?
				matches.each do |thismatch|
					unless thismatch[:regexp].nil?
						#pp thismatch
						thismatch[:regexp_compiled]=Regexp.new(thismatch[:regexp])					
					end

					[:version, :os, :string, :account, :model, :firmware, :module, :filepath].each do |label|
						if !thismatch[label].nil? and thismatch[label].class==Regexp
							thismatch[:regexp_compiled]=Regexp.new(thismatch[label])
							#pp thismatch
						end
					end

					unless thismatch[:text].nil?
						thismatch[:regexp_compiled]=Regexp.new(Regexp.escape(thismatch[:text]))
					end
				end
			end		
		end
	end


=begin
for adding/removing sets of plugins.

--plugins +plugins-disabled,-foobar (+ adds to the full set, -removes from the fullset. items can be directories, files or plugin names)
--plugins +/tmp/moo.rb
--plugins foobar (only select foobar)
--plugins ./plugins-disabled,-md5 (select only plugins from the plugins-disabled folder, remove the md5 plugin from the selected list)
=end
	def PluginSupport.load_plugins(list=nil)
		# separate l into a and b
		#	a = make list of dir & filenames
		#	b = make list of assumed pluginnames
		a=[];b=[]

		plugin_dirs=PLUGIN_DIRS.clone
		plugin_dirs.map {|p| p=File.expand_path(p) }

		if list
			list=list.split(",")

			plugins_disabled_location = ["plugins-disabled"].map {|x| $LOAD_PATH.map {|y| y+"/"+x if File.exists?(y+"/"+x) } }.flatten.compact

			list.each {|x| x.gsub!(/^\+$/,"+#{plugins_disabled_location}") } # + is short for +plugins-disabled

			list.each do |p|
				choice=PluginChoice.new
				choice.fill(p)
				a << choice if choice.type == "file"
				b << choice if choice.type == "plugin"
			end

			# sort by neither, add, minus
			a=a.sort

			if a.map {|c| c.modifier }.include?(nil)
				plugin_dirs=[]
			end

			minus_files = [] # make list of files not to load
			a.map {|c|
				plugin_dirs << c.name if c.modifier.nil? or c.modifier == "+"
				plugin_dirs -= [c.name] if c.modifier == "-" # for Dirs
				minus_files << c.name if c.modifier == "-"    # for files
			}
		
			# load files from plugin_dirs unless a file is minused
			plugin_dirs.each do |d|
				# if a folder, then load all files
				if File.directory?(d)
					(Dir.glob("#{d}/*.rb")-minus_files).each {|x| PluginSupport.load_plugin(x) }
				elsif File.exists?(d)
					PluginSupport.load_plugin(d)
				else
					error("Error: #{d} is not Dir or File")
				end
			end
		
			# make list of plugins to run
			# go through all plugins, remove from list any that match b minus
			selected_plugin_names=[]

			if b.map {|c| c.modifier }.include?(nil)
				selected_plugin_names=[]
			else
				selected_plugin_names = Plugin.registered_plugins.map {|n,p| n.downcase }
			end

			b.map {|c| 
				selected_plugin_names << c.name if c.modifier.nil? or c.modifier=="+"
				selected_plugin_names -= [c.name] if c.modifier == "-"
			}
			plugins_to_use = Plugin.registered_plugins.map {|n,p| [n,p] if selected_plugin_names.include?(n.downcase) }.compact

			# report on plugins that couldn't be found
			unfound_plugins = selected_plugin_names - plugins_to_use.map {|n,p| n.downcase }
			unless unfound_plugins.empty?
				puts "Error: The following plugins were not found: " + unfound_plugins.join(",")
			end

		else
			# no selection, so it's default
			plugin_dirs.each do |d|
				Dir.glob("#{d}/*.rb").each {|x|
					PluginSupport.load_plugin(x)
				}
			end
			plugins_to_use = Plugin.registered_plugins
		end

		plugins_to_use
	end






	def PluginSupport.custom_plugin(c)
		# define a custom plugin on the cmdline
		# ":text=>'powered by abc'" or
		# "{:text=>'powered by abc'},{:regexp=>/abc [ ]?1/i}"

		# then it's ok..
		if c =~ /:(text|ghdb|md5|regexp|tagpattern)=>[\/'"].*/
			matches="matches [\{#{c}\}]"
		end

		# this isn't checked for sanity... loading plugins = cmd exec anyway
		if c =~ /\{.*\}/
			matches="matches [#{c}]"
		end

		abort("Invalid custom plugin syntax: #{c}") if matches.nil?

		custom="Plugin.define \"Custom-Plugin\" do
		author \"Unknown\"
		description \"User defined\"
		#{matches}
		end
		"

		begin
			# open tmp file
			f=Tempfile.new('whatweb-custom-plugin')
			# write
			f.write(custom)
			f.close
			# load
			load f.path
			f.unlink
			true
		rescue SyntaxError
			error("Error: Cannot load custom plugin")
			false
		end
	end


	### some UI stuff


	def PluginSupport.plugin_list
		puts "WhatWeb Plugin List"
		puts
		puts ["Plugin Name".ljust(25),"Description"].join(" ")
		puts "-" * 79
		Plugin.registered_plugins.delete_if {|n,p| n == "\302\277" }.sort_by {|a,b| a.downcase }.each do |n,p|
			puts [n.ljust(25), (p.description.delete("\n\r") unless p.description.nil?)].join(" ")[0..78]
		end
		puts "-" * 30
		puts "#{Plugin.registered_plugins.size} Plugins Loaded"
		puts
	end



	# Show Google Dorks
	def PluginSupport.plugin_dorks(plugin_name)
		dorks=[]

		# Loop through plugins
		Plugin.registered_plugins.delete_if {|n,p| n == "\302\277" }.each do |n,p|
			if n.downcase == plugin_name.downcase
				pp "Google Dorks for #{n}:" if $verbose > 2
				dorks << p.dorks unless p.dorks.nil?
			end
		end

		# Show results if present, else show error message
		dorks.size > 0 ? puts(dorks) : error("Google dork lookup failed: Invalid plugin name or no dorks available")
	end

	# Show plugin information
	def PluginSupport.plugin_info(keywords= nil)
		puts "WhatWeb Plugin Information"
		puts "Searching for " + keywords.join(",") unless keywords.nil?
		puts "-" * 80

		puts ["Plugin Name".ljust(25),"Details"].join(" ")
		count=0
		Plugin.registered_plugins.delete_if {|n,p| n == "\302\277" }.sort_by {|a,b| a.downcase }.each do |name,plugin|
			# not include examples	
			dump=[name,plugin.author,plugin.description,plugin.matches].flatten.compact.to_a.join.downcase
			if keywords.empty? or keywords.map {|k| dump.include?(k.downcase) }.compact.include?(true)
				puts name
				puts "\tAuthor:".ljust(22) + plugin.author
				puts "\tVersion:".ljust(22) +plugin.version
	#			puts "\tCategory:".ljust(22) +plugin.category.to_s unless plugin.category.nil?
				puts "\tExamples:".ljust(22) +plugin.examples.size.to_s if plugin.examples
				puts "\tMatches:".ljust(22) +plugin.matches.size.to_s if plugin.matches
				puts "\tDorks:".ljust(22) +plugin.dorks.size.to_s if plugin.dorks
				puts "\tPassive function: ".ljust(22) + (defined?(plugin.passive) ? "Yes" : "No")
				puts "\tAggressive function: ".ljust(22) + (defined?(plugin.aggressive) ? "Yes" : "No")
				puts "\tVersion detection: ".ljust(22) + (plugin.version_detection? ? "Yes" : "No")
		
				if plugin.description
					puts "\tDescription: "
					word_wrap(plugin.description,72).each {|line| puts "\t" + line }
				end

				puts
				puts "-" * 80
				count+=1
			end
		end
		puts "#{count} plugins found"
		puts
	end


end


# This is used in plugin selection by load_plugins
class PluginChoice
	attr_accessor :modifier, :type, :name

	def <=>(s)
		x = -1 if self.modifier.nil?
		x = 0 if self.modifier=="+"
		x = 1 if self.modifier=="-"
		x
	end

	def fill(s)
		self.modifier = nil
		self.modifier=s[0].chr if ["+","-"].include?(s[0].chr)

		if self.modifier
			self.name=s[1..-1]
		else
			self.name=s
		end

		# figure out and store the filename or pluginname
		if File.exists?(File.expand_path(self.name))
			self.type = "file"
			self.name = File.expand_path(self.name)
		else
			self.name.downcase!
			self.type = "plugin"
		end
	end
end






