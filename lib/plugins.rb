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
  @registered_plugins = {}
  
  class << self
    attr_reader :registered_plugins
    private :new
    attr_reader :locked
    attr_reader :plugin_name
    @locked=false
  end

  def self.define(name, &block)
    p = new
    p.set_plugin_name(name)
    p.instance_eval(&block)
    p.startup
    Plugin.registered_plugins[name] = p
  end
 
  def set_plugin_name(s)
     @plugin_name = s
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
        @target=target
  	@body=target.body
  	@headers=target.headers
  	@status=target.status
  	@base_uri=target.uri
	@md5sum=target.md5sum
	@tagpattern=target.tag_pattern
	@ip=target.ip
	@raw_response = target.raw_response
	@raw_headers = target.raw_headers
  end

  def make_matches(target,match)
      r=[]
                        search_context = target.body # by default
			search_context = target.raw_response if match[:search] == "all"
			search_context = target.raw_headers if match[:search] == "headers"
			if match[:search] =~ /headers\[(.*)\]/
				if target.headers[$1]
					search_context = target.headers[$1]
				else
					return []
				end
			end

			unless match[:ghdb].nil?
				r << match if match_ghdb(match[:ghdb], target.body, target.headers, target.status, target.uri)
			end
			
			unless match[:text].nil?
				r << match if match[:regexp_compiled] =~ search_context
			end

			unless match[:md5].nil?
				r << match if target.md5sum == match[:md5]
			end

			unless match[:tagpattern].nil?
				r << match if target.tag_pattern == match[:tagpattern]
			end

			unless match[:regexp_compiled].nil?
				[:regexp,:account,:version,:os,:module,:model,:string,:firmware,:filepath].each do |symbol|
					if match[symbol] and match[symbol].class==Regexp
						regexpmatch = search_context.scan(match[:regexp_compiled])
				                unless regexpmatch.empty?
				                        m = match.dup
				                        m[symbol] = regexpmatch.map {|eachmatch|

									if eachmatch.is_a?(Array) and match[:offset]
										eachmatch[match[:offset]]
									elsif eachmatch.is_a?(Array)
										eachmatch.first
									elsif eachmatch.is_a?(String)
										eachmatch
									end
								}.flatten.sort.uniq
				                        r << m
				                end
					end
				end
			end

			# all previous matches are OR
			# these are ARE. e.g. required if present

			if match[:status]
				# status cannot match by itself. it needs friends
				unless r.empty?
					# this match is discarded unless it matches the status
					if match[:status] == target.status
						r << match 
					else
						r=[]
					end
				end
			end

			if match[:url]
				# url cannot match by itself. it needs friends
				unless r.empty?		
					target_url = target.uri.path
					target_url += "?" + target.uri.query unless target.uri.query.nil?
					if match[:url] == target_url
						r << match
					else
						r=[]
					end
				end
			end

			if match[:status] and match[:url]
				unless match[:status] == target.status and match[:url] == target.uri.path
					r=[]
				else
					r << match
				end
			end
	  r
  end

# execute plugin
  def x	
        results=[]

  	unless @matches.nil?
	  	@matches.each do |match|
		        results+=make_matches(@target,match)
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

                                newbase_uri=URI.join(@base_uri.to_s, match[:url]).to_s
				
                                aggressivetarget=Target.new(newbase_uri)
			        aggressivetarget.open
				
				if $verbose >1
#				  puts "#{@plugin_name} Aggressive: #{aggressivetarget.uri.to_s} [#{aggressivetarget.status}]"
				end

				results += make_matches(aggressivetarget,match)
			end
		end

	end
	
	# clean up results
	unless results.empty?
		results.each do |r|
			r [:certainty]=100 if r[:certainty].nil?
		end
	end

	results
  end

  extend PluginSugar
  def_field  :author, :version, :examples, :description, :matches, :cve, :dorks
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
			if $WWDEBUG==true or $verbose > 1
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

			plugins_disabled_location = ["plugins-disabled"].map {|x|
					$LOAD_PATH.map {|y| y+"/"+x if File.exists?(y+"/"+x) } 
				}.flatten.compact.first

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






	def PluginSupport.custom_plugin(c,*option)

		if option == ["grep"]
			matches="matches [:text=>\"#{c}\"]"

			custom="# coding: ascii-8bit
			Plugin.define \"Grep\" do
			author \"Unknown\"
			description \"User defined\"
			#{matches}
			end
			"
		else
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

			custom="# coding: ascii-8bit
			Plugin.define \"Custom-Plugin\" do
			author \"Unknown\"
			description \"User defined\"
			#{matches}
			end
			"
		end

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






