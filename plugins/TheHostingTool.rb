##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
# Version 0.2 #
# Fixed bug with returned modules not comma seperated
##
Plugin.define "TheHostingTool" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.3"
description "Free Open-Source hosting tool similar to cPanel"
website "http://thehostingtool.com/"
# 161 results for "powered by TheHostingTool" @ 2010-10-12

# Dorks #
dorks [
'"powered by TheHostingTool"'
]


matches [

# Version detection # Powered by text
{ :version=>/<div id="footer">Powered by <a href="http:\/\/thehostingtool.com" target="_blank">TheHostingTool<\/a> ([\d\.]*)<\/div>/ },

]

def passive
	m=[]

	# PHP Version detection
	if @body =~ /<td> ([\d\.]+) \(<a href="\?page=status&sub=phpinfo">PHPInfo<\/a>\)<\/td>/
		version=@body.scan(/<td> ([\d\.]+) \(<a href="\?page=status&sub=phpinfo">PHPInfo<\/a>\)<\/td>/).flatten.first
		m << { :version=>"PHP:"+version }
	end

	# MySQL version detection
	if @body =~ /<td><strong>MySQL Version:<\/strong><\/td>[\r\n|\n]+<td> ([\d\.]+) <\/td>/
		version=@body.scan(/<td><strong>MySQL Version:<\/strong><\/td>[\r\n|\n]+<td> ([\d\.]+) <\/td>/).flatten.first
		m << { :version=>"MySQL:"+version }
	end

	# OS detection
	if @body =~ /<td width="20%"><strong>Server OS:<\/strong><\/td>[\r\n|\n]+<td width="80%"> ([^\ ]+) <\/td>/
		version=@body.scan(/<td width="20%"><strong>Server OS:<\/strong><\/td>[\r\n|\n]+<td width="80%"> ([^\ ]+) <\/td>/).flatten.first
		m << { :version=>version }
	end

	# Module detection
	if @body =~ /<td align="center"><strong>([^<]+)<\/strong><\/td>/
		modules=@body.scan(/<td align="center"><strong>([^<]+)<\/strong><\/td>/).flatten
		m << { :module=>modules }
	end

	m

end

end

