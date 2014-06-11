##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 Haiku edits by Andrew Horton

Plugin.define "mysql_connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-19
version "0.2"
description "This plugin detects instances of the mysql_connect() function in PHP source code and retrieves the mysql server hostname, username and password if it's in plain-text. Alternatively, if the connection details are stored in variables it will return the variable names with possible values for those variables returned in :string=>"

# 338 results for mysql_connect ext:inc  @ 2011-01-19
# 172 results for mysql_connect ext:bak  @ 2011-01-19
# 129 results for mysql_connect ext:php~ @ 2011-01-19
#  28 results for mysql_connect ext:php1 @ 2011-01-19
#  13 results for mysql_connect ext:php2 @ 2011-01-19
# 499 results for mysql_connect ext:php3 @ 2011-01-19



# Passive #
# Detect instances of the mysql_connect function and extract details
def passive
	m=[]
	hup={}; hup[:host] = []; hup[:user] = []; hup[:pass] = []

	stuff={
		:host=>/mysql_connect\([\s]*([^\r^\n^\)]*),[\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/,
		:user=>/mysql_connect\([\s]*[^\r^\n^\)]*,[\s]*([^\r^\n^\)]*),[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/,
		:pass=>/mysql_connect\([\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*,[\s]*([^\r^\n^\)]*)\)[^\r^\n^;]*;/
	}

	# Detect mysql_connect() function
	if @body =~ /mysql_connect\([^\r^\n^\)]*,[\s]*[^\r^\n^\)]*,[\s]*[^\r^\n^\)]*\)[^\r^\n^;]*;/

		stuff.each do |symbol,regex|
			@body.scan(regex).each do |line|
				hup[symbol] << line
				if line.to_s =~ /^[\s]*\$[\w_]+/
					r=Regexp.new("[\s]*"+Regexp.escape(line.to_s)+"[\s]*=[\s]*([^\r^\n]*);")
					if @body =~ r
						found=@body.scan(r)
						if found.size > 1
							hup[symbol] << found.join("+") # u want to change this?
						else
							hup[symbol] << found.first
						end
					end
				end
			end
		end
		
		unless hup[:user].empty?
			# haiku

			# plugin changed, edit
			# rewritten sourcecode patterns
			# succint, better now

# hup ends up like this:
# {:pass=>[["\"\""], ["'680dgg%y'"]], :host=>[["\"localhost\""], ["'localhost'"]], :user=>[["\"root\""], ["'root'"]]}

			hup.values.each {|x| x.each {|y| y.first.gsub!(/^['"]|['"]$/,'') }} # remove the ' and "

			ret=(0..hup[:host].size-1).map {|x|
				[hup[:host][x],hup[:user][x],hup[:pass][x]].join(",") }.map {|x| '(' + x + ')' }.join(",")
			m << { :string=>ret }
		end
	end

	m
end

end

