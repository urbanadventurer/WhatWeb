##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Sambar-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-06
version "0.2"
description "Sambar server is a multi-threaded, extensible application server, web server and multi-protocol proxy server with highly programmable API. It has virtual domain support (currently name based) with independent document/CGI directories, log files, and error templates. Development and support of Sambar Server has been discontinued - More Info: http://en.wikipedia.org/wiki/Sambar_Server"

# ShodanHQ results as at 2011-04-06 #
# 1,063 for SAMBAR

matches [

	# HTTP Server Header # Version Detection
	{ :name=>"HTTP Server Header", :regexp=>/^SAMBAR/, :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :version=>/^SAMBAR ([\d\.]+)$/, :search=>"headers[server]" },

]

end
