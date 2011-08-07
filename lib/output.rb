=begin
Copyright 2009, 2010 Andrew Horton

This file is part of WhatWeb.

WhatWeb is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
at your option) any later version.

WhatWeb is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with WhatWeb.  If not, see <http://www.gnu.org/licenses/>.
=end

class Output
	def initialize(f=STDOUT)
	# if no f, output to STDOUT, if f is a filename then open it, if f is a file use it	
		@f = f if f.class == IO or f.class == File
		@f=File.open(f,"a") if f.class == String
		@f.sync = true # we want flushed output
	end

	def close
		@f.close unless @f.class == IO
	end

	# perform sort, uniq and join on each plugin result
	def suj(plugin_results)
		suj={}
		[:certainty, :version, :os, :string, :account, :model, :firmware, :module, :filepath].map do  |thissymbol|
			t=plugin_results.map {|x| x[thissymbol] unless x[thissymbol].class==Regexp }.flatten.compact.sort.uniq.join(",")
			suj[thissymbol] = t
		end
		suj[:certainty] = plugin_results.map {|x| x[:certainty] }.flatten.compact.sort.last.to_i # this is different, it's a number
		suj
	end

	# sort and uniq but no join. just for one plugin result
	def sortuniq(p)
		su={}
		[:name, :certainty, :version, :os, :string, :account, :model, :firmware, :module, :filepath].map do |thissymbol|
			unless p[thissymbol].class==Regexp
				t=p[thissymbol]
				t=t.flatten.compact.sort.uniq if t.is_a?(Array)
				su[thissymbol] = t unless t.nil?
			end					
		end
		# certainty is different, it's a number
		su[:certainty] = p[:certainty].to_i
		su
	end
end


class OutputObject < Output
	def out(target, status, results) 
		$semaphore.synchronize do 
			@f.puts "Identifying: "+ target.to_s
			@f.puts "HTTP-Status: "+ status.to_s
			@f.puts results.pretty_inspect unless results.empty?	
			@f.puts
		end
	end
end

class OutputVerbose < Output
	def coloured(s,colour)
		use_colour = ((@f == STDOUT and $use_colour=="auto") or ($use_colour=="always"))

		if use_colour
			send colour, s
		else
			s
		end
	end

	def out(target, status, results)
		$semaphore.synchronize do
			@f.puts "URL".ljust(7)+": #{coloured(target,'blue')}"
			@f.puts "Status".ljust(7)+": #{status}"
			results.sort.each do |plugin_name,plugin_results|
				unless plugin_results.empty?
				
					@f.puts "   "+coloured(plugin_name,"yellow")+ " " + coloured("-"*(80-5-plugin_name.size),"dark_blue")
				
					description=[""]
					unless Plugin.registered_plugins[plugin_name].description.nil?
						d=Plugin.registered_plugins[plugin_name].description[0..350] 
						d+="..." if d.size==251
						description=word_wrap(d, 60)
					end
#					@f.puts "\tCategory   : " + Plugin.registered_plugins[plugin_name].category.first unless Plugin.registered_plugins[plugin_name].category.nil?

					@f.puts "\tDescription: " + description.first
					description[1..-1].each {|line|
						@f.puts "\t" + " "*13 + line
					}


					top_certainty= suj(plugin_results)[:certainty].to_i
					unless top_certainty == 100
						@f.puts "\t"+"Certainty".ljust(11)+": " + certainty_to_words(top_certainty)
					end

					plugin_results.map {|x| sortuniq(x) }.each do |pr|

						if pr[:name]
							name_of_match = pr[:name]
						else
							name_of_match = [pr[:regexp_compiled],pr[:text],pr[:regexp].to_s,
										pr[:ghdb],pr[:md5],pr[:tagpattern]].compact.join("|")
						end

						pr.each do |key,value|
							next unless [:version, :os, :string, :account, :model, 
									:firmware, :module, :filepath, :url].include?(key)

							next if value.class==Regexp

							@f.print "\t" + key.to_s.capitalize.ljust(11) + ": "

							c = case key
								when :version then "green"
								when :string then "cyan"
								when :certainty then "grey"
								when :os then "red"
								when :account then "cyan"
								when :model then "dark_green"
								when :firmware then "dark_green"
								when :module then "magenta"
								when :filepath then "dark_green"
								else "grey"
							end

							if value.is_a?(String)
								@f.print coloured(value.to_s,c)
							elsif value.is_a?(Array)
								@f.print coloured(value.join(",").to_s,c)
							else
								@f.print coloured(value.inspect,c)
							end
						
							unless name_of_match.empty?
								@f.print " (from #{name_of_match})"
							end
							unless pr[:certainty] == 100
								@f.print " (Certainty: #{ certainty_to_words pr[:certainty]} )"
							end

							@f.puts
						end

						@f.puts "\t"+ coloured(pr.inspect.to_s,"dark_blue") if $verbose > 1
					end
					@f.puts			
				end
			end
		end
	end
end

class OutputBrief < Output

def escape(s)

	# Encode all special characters # More info: http://www.asciitable.com/
	r=/[^\x20-\x5A\x5E-\x7E]/

	# based on code for CGI.escape
	s.gsub(r) do |x|
		'%' + x.unpack('H2' * x.size).join('%').upcase
	end
end

# don't use colours if not to STDOUT
	def out(target, status, results)
		brief_results=[]

# sort results so plugins that are less important at a glance are last
		last_plugins=%w| CSS MD5 Header-Hash Footer-Hash Tag-Hash|
		results=results.sort_by {|x,y| last_plugins.include?(x) ? 1 : 0 }


		results.each do |plugin_name,plugin_results|
			unless plugin_results.empty?
				suj = suj(plugin_results)

				certainty, version, os, string, accounts,model,firmware,modules,filepath = suj[:certainty],suj[:version],suj[:os],suj[:string], suj[:account],suj[:model],suj[:firmware],suj[:module],suj[:filepath]

				# be more DRY		
				# if plugins have categories or tags this would be better, eg. all hash plugins are grey
				if (@f == STDOUT and $use_colour=="auto") or ($use_colour=="always")
					 string=escape(string)
					 coloured_string = yellow(string)
					 coloured_string = cyan(string) if plugin_name == "HTTPServer"
 				 	 coloured_string = dark_green(string) if plugin_name == "Title"

 				 	 coloured_string = grey(string) if plugin_name == "MD5" 				 	 
 				 	 coloured_string = grey(string) if plugin_name == "Header-Hash"
 				 	 coloured_string = grey(string) if plugin_name == "Footer-Hash"
 				 	 coloured_string = grey(string) if plugin_name == "CSS"
					 coloured_string = grey(string) if plugin_name == "Tag-Hash"
 					 
					 coloured_plugin = white(plugin_name)
					 coloured_plugin = grey(plugin_name) if plugin_name == "MD5"
  					 coloured_plugin = grey(plugin_name) if plugin_name == "Header-Hash"
  					 coloured_plugin = grey(plugin_name) if plugin_name == "Footer-Hash"  					 
  					 coloured_plugin = grey(plugin_name) if plugin_name == "CSS"
					 coloured_plugin = grey(plugin_name) if plugin_name == "Tag-Hash"
  					 					 
					 p = ((certainty and certainty < 100) ? grey(certainty_to_words(certainty))+ " " : "")  +
					   coloured_plugin + (!version.empty? ? "["+green(escape(version))+"]" : "") +
					   (!os.empty? ? "[" + red(escape(os))+"]" : "") +	
					   (!string.empty? ? "[" + coloured_string+"]" : "") +
					   (!accounts.empty? ? "["+ cyan(escape(accounts))+"]" : "" ) +
					   (!model.empty? ? "["+ dark_green(escape(model))+"]" : "" ) +
					   (!firmware.empty? ? "["+ dark_green(escape(firmware))+"]" : "" ) +
					   (!filepath.empty? ? "["+ dark_green(escape(filepath))+"]" : "" ) +
					   (!modules.empty? ? "["+ magenta(escape(modules))+"]" : "" )

					 
					 brief_results << p
				else
					brief_results << ((certainty and certainty < 100) ? certainty_to_words(certainty)+ " " : "")  +
					   plugin_name + (!version.empty? ? "[" + version +"]" : "") +
					   (!os.empty? ? "[" + os+"]" : "") +
					   (!string.empty? ? "[" + string+"]" : "") +
					   (!accounts.empty? ? " ["+ accounts+"]" : "" ) +
					   (!model.empty? ? "["+ model+"]" : "" ) +
					   (!firmware.empty? ? "["+ firmware+"]" : "" ) +
					   (!filepath.empty? ? "["+ filepath+"]" : "" ) +
					   (!modules.empty? ? "["+ modules+"]" : "" )
				end	
			end
		end
		
		$semaphore.synchronize do 
			if (@f == STDOUT and $use_colour=="auto") or ($use_colour=="always")
				@f.puts blue(target) + " [#{status}] " + brief_results.join(", ")
			else
				@f.puts target.to_s + " [#{status}] " + brief_results.join(", ")
			end		
		end
	end
end

# XML Output #
# Does anyone use XML output?
# We'd love to hear any suggestions you may have!
# Does it bother you that some types of output are joined by commas
# but other types aren't?
class OutputXML < Output
	def initialize(f=STDOUT)
		super
		@substitutions={'&'=>'&amp;', '"'=>'&quot;', '<'=>'&lt;', '>'=>'&gt;'}
		@f.puts '<?xml version="1.0"?><?xml-stylesheet type="text/xml" href="whatweb.xsl"?>'
		@f.puts "<log>"
	end

	def close
		@f.puts "</log>"
		@f.close
	end

	def escape(t)		
		text=t.to_s.dup
		# use sort_by so that & is before &quot;, etc.
		@substitutions.sort_by {|a,b| a=="&" ? 0 : 1 }.map{|from,to| text.gsub!(from,to) }

		# Encode all special characters
		# More info: http://www.asciitable.com/
		r=/[^\x20-\x5A\x5E-\x7E]/

		# based on code for CGI.escape
		text.gsub!(r) do |x|
			'%' + x.unpack('H2' * x.size).join('%').upcase
		end

		text
	end

	def out(target, status, results)	
		$semaphore.synchronize do 
			@f.puts "<target>"
			@f.puts "\t<uri>#{escape(target)}</uri>"
			@f.puts "\t<http-status>#{escape(status)}</http-status>"

			results.each do |plugin_name,plugin_results|		
				@f.puts "\t<plugin>"
				@f.puts "\t\t<name>#{escape(plugin_name)}</name>"

				unless plugin_results.empty?
					# important info in brief mode is version, type and ?
					# what's the highest probability for the match?

					certainty = plugin_results.map {|x|
		x[:certainty] unless x[:certainty].class==Regexp }.flatten.compact.sort.uniq.last
					version = plugin_results.map {|x|
		x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq.join(",")
					os = plugin_results.map {|x|
		x[:os] unless x[:os].class==Regexp}.flatten.compact.sort.uniq.join(",")
					string = plugin_results.map {|x|
		x[:string] unless x[:string].class==Regexp}.flatten.compact.sort.uniq.join(",")
					model = plugin_results.map {|x|
		x[:model] unless x[:model].class==Regexp}.flatten.compact.sort.uniq.join(",")
					firmware = plugin_results.map {|x|
		x[:firmware] unless x[:firmware].class==Regexp}.flatten.compact.sort.uniq.join(",")
					filepath = plugin_results.map {|x|
		x[:filepath] unless x[:filepath].class==Regexp}.flatten.compact.sort.uniq.join(",")

					account = plugin_results.map {|x|
		x[:account] unless x[:account].class==Regexp}.flatten.compact.sort.uniq.join(",")
					modules = plugin_results.map {|x|
		x[:module] unless x[:module].class==Regexp}.flatten.compact.sort.uniq.join(",")

					# Output results
					@f.puts "\t\t<certainty>#{escape(certainty)}</certainty>" if certainty and certainty < 100
					version.map  {|x| @f.puts "\t\t<version>#{escape(x)}</version>"  }
					os.map {|x| @f.puts "\t\t<os>#{escape(x)}</os>" }
					string.map {|x| @f.puts "\t\t<string>#{escape(x)}</string>" }
					model.map {|x| @f.puts "\t\t<model>#{escape(x)}</model>" }
					firmware.map {|x| @f.puts "\t\t<firmware>#{escape(x)}</firmware>" }
					filepath.map {|x| @f.puts "\t\t<filepath>#{escape(x)}</filepath>" }
					account.map {|x| @f.puts "\t\t<account>#{escape(x)}</account>" }
					modules.map {|x| @f.puts "\t\t<module>#{escape(x)}</module>" }
				end
				@f.puts "\t</plugin>"
			end
			@f.puts "</target>"
		end
	end
end


# MagicTree #
# Output XML file in MagicTree XML format
class OutputMagicTreeXML < Output
	def initialize(f=STDOUT)
		super
		@substitutions={'&'=>'&amp;', '"'=>'&quot;', '<'=>'&lt;', '>'=>'&gt;'}
		@f.puts '<?xml version="1.0" encoding="UTF-8"?>'
		@f.puts '<magictree class="MtBranchObject">'
	end

	def close
		@f.puts '</magictree>'
		@f.close
	end

	def escape(t)		
		text=t.to_s.dup
		# use sort_by so that & is before &quot;, etc.
		@substitutions.sort_by {|a,b| a=="&" ? 0 : 1 }.map{|from,to| text.gsub!(from,to) }

		# Encode all special characters
		# More info: http://www.asciitable.com/
		r=/[^\x20-\x5A\x5E-\x7E]/

		# based on code for CGI.escape
		text.gsub!(r) do |x|
			'%' + x.unpack('H2' * x.size).join('%').upcase
		end

		text
	end

	def out(target, status, results)

		$semaphore.synchronize do

			# Parse target URL and initialize host node details
			uri = URI.parse(target.to_s)
			@host_os=[]
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
			results.each do |plugin_name,plugin_results|
				unless plugin_results.empty?
					# Host IP
					@host_ip = plugin_results.map {|x| x[:string] unless x[:string].nil?}.to_s if plugin_name =~ /^IP$/
					# Host Country
					@host_country = plugin_results.map {|x| x[:string] unless x[:string].nil?}.to_s if plugin_name =~ /^Country$/
					# Host OS
					@host_os << plugin_results.map {|x| x[:os] unless x[:os].class==Regexp}.to_s
				end
			end

			# testdata branch
			@f.write "<testdata class=\"MtBranchObject\"><host>#{escape(@host_ip)}"

			# hostname
			@f.write "<hostname>#{escape(@host_name)}</hostname>" unless @host_name.nil?

			# os
			@host_os.compact.sort.uniq.map {|x| @f.write "<os>#{escape(x.to_s)}</os>" unless x.empty? } unless @host_os.empty?

			# country and port nodes
			@f.write "<country>#{escape(@host_country)}</country><ipproto>tcp<port>#{escape(@host_port)}<state>open</state>"

			# https
			if @host_scheme == 'https'
				@f.write "<tunnel>ssl";
			end

			# Service node # Loop through remaining results
			# software, headers, firmware, modules, etc. are all related to a specific URL and therefore are placed under the url node
			@f.puts "<service>http";
			results.each do |plugin_name,plugin_results|

				if !plugin_results.empty? and plugin_name !~ /^IP$/ and plugin_name !~ /^Country$/
					certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.flatten.compact.sort.uniq.last
					versions = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq.to_a
					strings = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp}.flatten.compact.sort.uniq.to_a
					models = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp}.flatten.compact.sort.uniq.to_a
					firmwares = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp}.flatten.compact.sort.uniq.to_a
					filepaths = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp}.flatten.compact.sort.uniq.to_a
					accounts = plugin_results.map {|x| x[:account]  unless x[:account].class==Regexp }.flatten.compact.sort.uniq.to_a
					modules = plugin_results.map {|x|  x[:module]   unless x[:module].class==Regexp}.flatten.compact.sort.uniq.to_a

					# URL node # plugin node
					@f.write "<url>#{escape(target)}<#{escape(plugin_name)}>"

					# Print certainty if certainty < 100
					if certainty and certainty < 100
						@f.write "<certainty>#{escape(certainty)}</certainty>"
					end

					# Strings
					if strings.size > 0
						strings.map {|x| @f.write "#{escape(x)}" } unless plugin_name =~ /^IP$/ or plugin_name =~ /^Country$/
					end

					# Versions
					if versions.size > 0
						versions.map {|x| @f.write "<version>#{escape(x)}</version>" }
					end

					# Models
					if models.size > 0
						models.map {|x| @f.puts "<model>#{escape(x)}</model>" }
					end

					# Firmware
					if firmwares.size > 0
						firmwares.map {|x| @f.write "<firmware>#{escape(x)}</firmware>" }
					end

					# Modules
					if modules.size > 0
						modules.map {|x| @f.write "<module>#{escape(x)}</module>" } unless plugin_name =~ /^Country$/
					end

					# Accounts # MagicTree generally uses "user" nodes for account 
					if accounts.size > 0
						accounts.map {|x| @f.write "<user>#{escape(x)}</user>" }
					end

					# Local File Filepaths # Not to be confused with file paths in the web root which are returned in Strings
					if filepaths.size > 0
						filepaths.map {|x| @f.write "<filepath>#{escape(x)}</filepath>" }
					end

					# debug node # Uncomment to debug
					# @f.write "<debug title=\"WhatWeb\" class=\"MtTextObject\">Identifying: #{escape(target)}\nHTTP-Status: #{escape(status)}"
					# @f.write "#{escape(results.pretty_inspect)}" unless results.empty?
					# @f.write "</debug>"


					# Close plugin name and URL nodes

					@f.write "</#{escape(plugin_name)}></url>"

				end

			end
			@f.write "</service>";

			# end https node
			if @host_scheme == 'https'
				@f.write "</tunnel>"
			end

			# testdata # close port, host and testdata nodes
			@f.write "</port></ipproto></host></testdata>"

		end
	end

end

# JSON Output #
class OutputJSON < Output

	def flatten_elements!(obj)
		if obj.class == Hash
			obj.each_value {|x| 
				flatten_elements!(x)
			}
		end

		if obj.class == Array
			obj.flatten!
		end
	end

	def utf8_elements!(obj)
		if obj.class == Hash
			obj.each_value {|x| 
				utf8_elements!(x)
			}
		end

		if obj.class == Array
			obj.each {|x| 
				utf8_elements!(x)
			}
		end

		if obj.class == String
#			obj=obj.upcase!
#			obj=Iconv.iconv("UTF-8",@charset,obj).join
			obj=obj.gsub!(/^.*$/,Iconv.iconv("UTF-8",@charset,obj).join) # this is a bad way to do this but it works			
		end
	end

	def out(target, status, results)
		# nice
		foo= {:target=>target, :http_status=>status, :plugins=>{} } 
		
		results.each do |plugin_name,plugin_results|		
#			thisplugin = {:name=>plugin_name}
			thisplugin = {}
			
			unless plugin_results.empty?
				# important info in brief mode is version, type and ?
				# what's the highest probability for the match?

				certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.flatten.compact.sort.uniq.last

				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq
				os = plugin_results.map {|x| x[:os] unless x[:os].class==Regexp }.flatten.compact.sort.uniq
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.flatten.compact.sort.uniq
				accounts = plugin_results.map {|x| x[:account] unless x[:account].class==Regexp }.flatten.compact.sort.uniq
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.flatten.compact.sort.uniq
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.flatten.compact.sort.uniq
				modules = plugin_results.map {|x| x[:module] unless x[:module].class==Regexp }.flatten.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.flatten.compact.sort.uniq

				if !certainty.nil? and certainty != 100
					thisplugin[:certainty] = certainty
				end

				thisplugin[:version] = version unless version.empty?
				thisplugin[:os] = os unless os.empty?
				thisplugin[:string] = string unless string.empty?
				thisplugin[:account] = accounts unless accounts.empty?
				thisplugin[:model] = model unless model.empty?
				thisplugin[:firmware] = firmware unless firmware.empty?
				thisplugin[:module] = modules unless modules.empty?
				thisplugin[:filepath] = filepath unless filepath.empty?
#				foo[:plugins] << thisplugin
				foo[:plugins][plugin_name.to_sym] = thisplugin
			end
		end

		@charset=results.map {|n,r| r[0][:string] if n=="Charset" }.compact.first
		unless @charset.nil? or @charset == "Failed"
			utf8_elements!(foo) # convert foo to utf-8
			flatten_elements!(foo)			
		end

		$semaphore.synchronize do 
			@f.puts JSON::fast_generate(foo)
		end
	end
end


# basically the same as OutputJSON
class OutputMongo < Output

	def initialize(s)		
		host=s[:host] || "0.0.0.0"
		database=s[:database] || raise("Missing MongoDB database name")
		collection=s[:collection] || "whatweb"

		# should make databse and collection comma or fullstop delimited, eg. test,scan
		@db = Mongo::Connection.new(host).db(database) # resolve-replace means we can't connect to localhost by name and must use 0.0.0.0
		auth = @db.authenticate(s[:username], s[:password]) if s[:username]
		@coll=@db.collection(collection)
		@charset=nil
	end

	def close
		# nothing
	end

	def flatten_elements!(obj)
		if obj.class == Hash
			obj.each_value {|x| 
				flatten_elements!(x)
			}
		end

		if obj.class == Array
			obj.flatten!
		end

	end

	def utf8_elements!(obj)
		if obj.class == Hash
			obj.each_value {|x| 
				utf8_elements!(x)
			}
		end

		if obj.class == Array
			obj.each {|x| 
				utf8_elements!(x)
			}
		end

		if obj.class == String
#			obj=obj.upcase!
#			obj=Iconv.iconv("UTF-8",@charset,obj).join
			obj=obj.gsub!(/^.*$/,Iconv.iconv("UTF-8",@charset,obj).join) # this is a bad way to do this but it works			
		end
	end

	def out(target, status, results)
		# nice
		foo= {:target=>target, :http_status=>status, :plugins=>{} } 
		
		results.each do |plugin_name,plugin_results|		
#			thisplugin = {:name=>plugin_name}
			thisplugin = {}
			
			unless plugin_results.empty?
				# important info in brief mode is version, type and ?
				# what's the highest probability for the match?

				certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.compact.sort.uniq.last					
				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq
				os = plugin_results.map {|x| x[:os] unless x[:os].class==Regexp }.flatten.compact.sort.uniq
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.flatten.compact.sort.uniq
				accounts = plugin_results.map {|x| x[:account] unless x[:account].class==Regexp }.flatten.compact.sort.uniq
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.flatten.compact.sort.uniq
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.flatten.compact.sort.uniq
				modules = plugin_results.map {|x| x[:module] unless x[:module].class==Regexp }.flatten.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.flatten.compact.sort.uniq

				if !certainty.nil? and certainty != 100
					thisplugin[:certainty] = certainty
				end
				thisplugin[:version] = version unless version.empty?
				thisplugin[:os] = os unless os.empty?
				thisplugin[:string] = string unless string.empty?
				thisplugin[:account] = accounts unless accounts.empty?
				thisplugin[:model] = model unless model.empty?
				thisplugin[:firmware] = firmware unless firmware.empty?
				thisplugin[:module] = modules unless modules.empty?
				thisplugin[:filepath] = filepath unless filepath.empty?
#				foo[:plugins] << thisplugin
				foo[:plugins][plugin_name.to_sym] = thisplugin
			end
		end

		@charset=results.map {|n,r| r[0][:string] if n=="Charset" }.compact.first
		
		unless @charset.nil? or @charset == "Failed"
			utf8_elements!(foo) # convert foo to utf-8
			flatten_elements!(foo)
			@coll.insert(foo)
		else
			error("#{target}: Failed to detect Character set and log to MongoDB")
		end

	end
end



class OutputJSONVerbose < Output
	def out(target, status, results)
		# brutal and simple
		$semaphore.synchronize do 
			@f.puts JSON::fast_generate([target,status,results])
		end
	end
end

class OutputErrors < Output
	def out(error)
		$semaphore.synchronize do 
			@f.puts error
		end
	end	
end


class OutputSQL < Output
	
	def flatten_elements!(obj)
		if obj.class == Hash
			obj.each_value {|x| 
				flatten_elements!(x)
			}
		end

		if obj.class == Array
			obj.flatten!
		end
	end

	def escape_for_sql(s)
		s=s.to_s
		if s.nil?
			"''"
		else
			"'"+ s.gsub("'","\'")+"'"
		end
	end

	def initialize(f=STDOUT)
		super
	end
	
	def create_tables
		# feel free to modify this
		@f.puts "CREATE TABLE plugins (plugin_id int NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL,PRIMARY KEY (plugin_id), UNIQUE (name));"
		@f.puts "CREATE TABLE targets (target_id int NOT NULL AUTO_INCREMENT, target varchar(900) NOT NULL, status varchar(10),PRIMARY KEY (target_id), UNIQUE (target, status) );"
		@f.puts "CREATE TABLE scans (scan_id int NOT NULL AUTO_INCREMENT, plugin_id INT NOT NULL, target_id INT NOT NULL, version varchar(255), os varchar(255), string varchar(1024), account varchar(1024), model varchar(1024), firmware varchar(1024), module varchar(1024), filepath varchar(1024), certainty varchar(10) ,PRIMARY KEY (scan_id));"
	
		# plugins table
		@f.puts "INSERT INTO plugins (name) VALUES ('Custom-Plugin');"

		Plugin::registered_plugins.each do |n,p|
			@f.puts "INSERT INTO plugins (name) VALUES (#{ escape_for_sql(n) });"
		end
	end

	def out(target, status, results)

		# nice
		foo= {:target=>target, :http_status=>status, :plugins=>{} } 
		
		results.each do |plugin_name,plugin_results|		
			thisplugin = {}
			
			unless plugin_results.empty?
				# important info in brief mode is version, type and ?
				# what's the highest probability for the match?

				certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.flatten.compact.sort.uniq.last

				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq
				os = plugin_results.map {|x| x[:os] unless x[:os].class==Regexp }.flatten.compact.sort.uniq
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.flatten.compact.sort.uniq
				accounts = plugin_results.map {|x| x[:account] unless x[:account].class==Regexp }.flatten.compact.sort.uniq
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.flatten.compact.sort.uniq
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.flatten.compact.sort.uniq
				modules = plugin_results.map {|x| x[:module] unless x[:module].class==Regexp }.flatten.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.flatten.compact.sort.uniq

				if !certainty.nil? and certainty != 100
					thisplugin[:certainty] = certainty
				end

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
		end

		flatten_elements!(foo)			
		
		i_target = escape_for_sql(foo[:target])
		insert = [escape_for_sql(foo[:http_status]), i_target].join(",")

		query = "INSERT IGNORE INTO targets (status,target) VALUES (#{ insert });";
		@f.puts query
		foo[:plugins].each do |x| 

			plugin_name = escape_for_sql(x.first.to_s)

			insert = [ escape_for_sql(x[1][:version].join(",").to_s), escape_for_sql(x[1][:os].join(",").to_s),
					escape_for_sql(x[1][:string].join(",").to_s), 	escape_for_sql(x[1][:account].join(",").to_s), escape_for_sql(x[1][:model].join(",").to_s),
					escape_for_sql(x[1][:firmware].join(",").to_s),	escape_for_sql(x[1][:module].join(",").to_s), escape_for_sql(x[1][:filepath].join(",").to_s),
					escape_for_sql(x[1][:certainty].to_s) ].join(",")

			query = "INSERT INTO scans (target_id, plugin_id, version, os, string, account, model, firmware, module, filepath, certainty) VALUES ( (SELECT target_id from targets WHERE target = #{i_target}),(SELECT plugin_id from plugins WHERE name = #{plugin_name}), #{insert} );";
			@f.puts query
		end

	end
end

