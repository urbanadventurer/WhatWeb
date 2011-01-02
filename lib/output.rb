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
end

class OutputFull < Output
	def out(target, status, results) 
		@f.puts "Identifying: "+ target.to_s
		@f.puts "HTTP-Status: "+ status.to_s
		@f.puts results.pretty_inspect unless results.empty?	
		@f.puts
	end
end

class OutputVerbose < Output
	def out(target, status, results)
		results.each do |plugin_name,plugin_results|
			unless plugin_results.empty?
				@f.print plugin_name + " " * (30- plugin_name.size )+   " => "
				matches = plugin_results.map do |pr|					
					if pr[:name]
						name_of_match = pr[:name]
					else
						name_of_match = [pr[:text],pr[:regexp].to_s,pr[:ghdb],pr[:md5],pr[:tagpattern]].compact.join("|")
					end
					stuff =[] 
					stuff << "certainty: #{pr[:certainty]}" if pr[:certainty] != 100
					stuff << "version: #{pr[:version]}" if pr[:version]
					stuff << "string: #{pr[:string]}" if pr[:string]
					stuff << "model: #{pr[:model]}" if pr[:model]
					stuff << "firmware: #{pr[:firmware]}" if pr[:firmware]
					stuff << "modules: #{pr[:modules]}" if pr[:modules]
					stuff << "accounts: #{pr[:accounts]}" if pr[:accounts]
					stuff << "filepath: #{pr[:filepath]}" if pr[:filepath]
					stuff << "url: #{pr[:url]}" if pr[:url]
					name_of_match + ( !stuff.empty? ? " (" + stuff.join(",") +")" : "" )
				end
				puts matches.join(", ")
			end
		end
	end
end

class OutputBrief < Output

def escape(s)
	# [] and all characters up to space.
	r=/[\[\]\001\002\003\004\005\006\a\b\t\n\v\f\r\016\017\020\021\022\023\024\025\026\027\030\031\032\e\034\035\036\037]/
	# based on code for CGI.escape
	s.gsub(r) do |x|
		'%' + x.unpack('H2' * x.size).join('%').upcase
	end
end

# don't use colours if not to STDOUT
	def out(target, status, results)
		brief_results=[]

# sort results so plugins that are less important at a glance are last
		last_plugins=%w| CSS MD5 Header-Hash Footer-Hash Div-Span-Structure Tag-Hash|
		results=results.sort_by {|x,y| last_plugins.include?(x) ? 1 : 0 }


		results.each do |plugin_name,plugin_results|
			unless plugin_results.empty?
				# important info in brief mode is version, type and ?
				# what's the highest probability for the match?
				certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.compact.sort.uniq.last					
				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.compact.sort.uniq.join(",")
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.compact.sort.uniq.join(",")
				accounts = plugin_results.map {|x| [x[:account],x[:accounts] ] }.flatten.compact.sort.uniq.join(",")
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.compact.sort.uniq.join(",")
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.compact.sort.uniq.join(",")
				modules = plugin_results.map {|x| x[:modules] unless x[:modules].class==Regexp }.compact.sort.uniq.join(",")
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.compact.sort.uniq.join(",")

				# be more DRY		
				# if plugins have categories or tags this would be better, eg. all hash plugins are grey
				if (@f == STDOUT and $use_colour=="auto") or ($use_colour=="always")
					 string=escape(string)
					 coloured_string = yellow(string)
					 coloured_string = cyan(string) if plugin_name == "HTTPServer"
 				 	 coloured_string = dark_green(string) if plugin_name == "Title"
 				 	 coloured_string = grey(string) if plugin_name == "MD5" 				 	 
 				 	 coloured_string = grey(string) if plugin_name == "Div-Span-Structure" 				 	 
 				 	 coloured_string = grey(string) if plugin_name == "Header-Hash"
 				 	 coloured_string = grey(string) if plugin_name == "Footer-Hash"
 				 	 coloured_string = grey(string) if plugin_name == "CSS"
					 coloured_string = grey(string) if plugin_name == "Tag-Hash"
 				 	  				 	  				 	 					 
					 coloured_plugin = white(plugin_name)
					 coloured_plugin = grey(plugin_name) if plugin_name == "MD5"
 					 coloured_plugin = grey(plugin_name) if plugin_name == "Div-Span-Structure"
  					 coloured_plugin = grey(plugin_name) if plugin_name == "Header-Hash"
  					 coloured_plugin = grey(plugin_name) if plugin_name == "Footer-Hash"  					 
  					 coloured_plugin = grey(plugin_name) if plugin_name == "CSS"
					 coloured_plugin = grey(plugin_name) if plugin_name == "Tag-Hash"
  					 					 
					 p = ((certainty and certainty < 100) ? grey(certainty_to_words(certainty))+ " " : "")  +
					   coloured_plugin + (!version.empty? ? "["+green(escape(version))+"]" : "") +
					   (!string.empty? ? "[" + coloured_string+"]" : "") +
					   (!accounts.empty? ? "["+ escape(accounts)+"]" : "" ) +
					   (!model.empty? ? "["+ dark_green(escape(model))+"]" : "" ) +
					   (!firmware.empty? ? "["+ dark_green(escape(firmware))+"]" : "" ) +
					   (!filepath.empty? ? "["+ dark_green(escape(filepath))+"]" : "" ) +
					   (!modules.empty? ? "["+ magenta(escape(modules))+"]" : "" )

					 
					 brief_results << p
				else
					brief_results << ((certainty and certainty < 100) ? certainty_to_words(certainty)+ " " : "")  +
					   plugin_name + (!version.empty? ? "[" + version +"]" : "") +
					   (!string.empty? ? "[" + string+"]" : "") +
					   (!accounts.empty? ? " ["+ accounts+"]" : "" ) +
					   (!model.empty? ? "["+ model+"]" : "" ) +
					   (!firmware.empty? ? "["+ firmware+"]" : "" ) +
					   (!filepath.empty? ? "["+ firmware+"]" : "" ) +
					   (!modules.empty? ? "["+ modules+"]" : "" )
				end	
			end
		end
		
		if (@f == STDOUT and $use_colour=="auto") or ($use_colour=="always")
			@f.puts blue(target) + " [#{status}] " + brief_results.join(", ")
		else
			@f.puts target.to_s + " [#{status}] " + brief_results.join(", ")
		end		
		
	end
end


# Hey, do u actually use this XML output? Then I'd love to hear from you for suggestions, changes, etc.
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
		text
	end

	def out(target, status, results)	
		@f.puts "<target>"
		@f.puts "\t<uri>#{escape(target)}</uri>"
		@f.puts "\t<http-status>#{escape(status)}</http-status>"
		
		results.each do |plugin_name,plugin_results|		
			@f.puts "\t<plugin>"
			@f.puts "\t\t<name>#{escape(plugin_name)}</name>"
			
			unless plugin_results.empty?
				# important info in brief mode is version, type and ?
				# what's the highest probability for the match?
				certainty = plugin_results.map {|x| x[:certainty] unless x[:certainty].class==Regexp }.compact.sort.uniq.last
				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.flatten.compact.sort.uniq.join(",")
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp}.flatten.compact.sort.uniq.join(",")
				accounts = plugin_results.map {|x| [x[:account],x[:accounts] ] }.flatten.compact.sort.uniq.join(",")
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp}.compact.sort.uniq.join(",")
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp}.compact.sort.uniq.join(",")
				modules = plugin_results.map {|x| x[:modules] unless x[:modules].class==Regexp}.flatten.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp}.flatten.compact.sort.uniq.join(",")

				@f.puts "\t\t<certainty>#{escape(certainty)}</certainty>" if certainty and certainty < 100
				version.map  {|x| @f.puts "\t\t<version>#{escape(x)}</version>"  }
				string.map   {|x| @f.puts "\t\t<string>#{escape(x)}</string>" }
				accounts.map {|x| @f.puts "\t\t<accounts>#{escape(x)}</accounts>" }
				model.map {|x| @f.puts "\t\t<model>#{escape(x)}</model>" }
				firmware.map {|x| @f.puts "\t\t<firmware>#{escape(x)}</firmware>" }
				filepath.map {|x| @f.puts "\t\t<filepath>#{escape(x)}</filepath>" }

				if modules.size > 0
					@f.puts "\t\t<modules>\n" + modules.map {|x| "\t\t\t<module>#{escape(x)}</module>" }.join("\n") + "\n\t\t</modules>"
				end
			end
			@f.puts "\t</plugin>"
		end
		@f.puts "</target>"
	end
end

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

#		if obj.class == String

#		end
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
				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.compact.sort.uniq
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.compact.sort.uniq
				accounts = plugin_results.map {|x| [x[:account],x[:accounts] ] }.flatten.compact.sort.uniq
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.compact.sort.uniq
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.compact.sort.uniq
				modules = plugin_results.map {|x| x[:modules] unless x[:modules].class==Regexp }.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.compact.sort.uniq


				certainty.nil? ? thisplugin[:certainty] = 100 : thisplugin[:certainty] = certainty
				thisplugin[:version] = version unless version.empty?
				thisplugin[:string] = string unless string.empty?
				thisplugin[:accounts] = accounts unless accounts.empty?
				thisplugin[:model] = model unless model.empty?
				thisplugin[:firmware] = firmware unless firmware.empty?
				thisplugin[:modules] = modules unless modules.empty?
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
		@f.puts JSON::fast_generate(foo)
	end
end


# basically the same as OutputJSON
class OutputMongo < Output

	def initialize(collection)
	# should make databse and collection comma or fullstop delimited, eg. test,scan
		@db = Mongo::Connection.new("0.0.0.0").db("test") # resolve-replace means we can't connect to localhost by name
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

#		if obj.class == String

#		end
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
				version = plugin_results.map {|x| x[:version] unless x[:version].class==Regexp }.compact.sort.uniq
				string = plugin_results.map {|x| x[:string] unless x[:string].class==Regexp }.compact.sort.uniq
				accounts = plugin_results.map {|x| [x[:account],x[:accounts] ] }.flatten.compact.sort.uniq
				model = plugin_results.map {|x| x[:model] unless x[:model].class==Regexp }.compact.sort.uniq
				firmware = plugin_results.map {|x| x[:firmware] unless x[:firmware].class==Regexp }.compact.sort.uniq
				modules = plugin_results.map {|x| x[:modules] unless x[:modules].class==Regexp }.compact.sort.uniq
				filepath = plugin_results.map {|x| x[:filepath] unless x[:filepath].class==Regexp }.compact.sort.uniq

				certainty.nil? ? thisplugin[:certainty] = 100 : thisplugin[:certainty] = certainty
				thisplugin[:version] = version unless version.empty?
				thisplugin[:string] = string unless string.empty?
				thisplugin[:accounts] = accounts unless accounts.empty?
				thisplugin[:model] = model unless model.empty?
				thisplugin[:firmware] = firmware unless firmware.empty?
				thisplugin[:modules] = modules unless modules.empty?
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
		end
	end
end



class OutputJSONVerbose < Output
	def out(target, status, results)
		# brutal and simple
		@f.puts JSON::fast_generate([target,status,results])
	end
end

class OutputErrors < Output
	def out(error)
		@f.puts error
	end
	
end

