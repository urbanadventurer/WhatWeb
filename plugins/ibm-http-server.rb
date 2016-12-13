##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "IBM-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.3"
description "IBM HTTP Server is based on the Apache HTTP Server (httpd.apache.org), developed by the Apache Software Foundation. IBM HTTP Server can be remotely administered and configured using the WebSphere administrative console"
website "http://www.ibm.com/software/webservers/httpservers/"

# ShodanHQ results as at 2010-10-25 #
# 23,022 for "Server: IBM_HTTP_Server"
# 34 for "srvrname:"

matches [
	# Server HTTP Header
	{ :version=>/[\s]*IBM-HTTP-Server\/([\d\.]+)/, :search=>"headers[server]" },
	{ :version=>/[\s]*IBM_HTTP_Server\/([\d\.]+)/, :search=>"headers[server]" },
	{ :name=>"IBM_HTTP_Server", :regexp=>/^[\s]*IBM_HTTP_Server/ ,:search=>"headers[server]" },
	
	# srvrname HTTP Header
	{ :string=>/^(.*)$/, :search=>"headers[srvrname]" },
	
]

end

