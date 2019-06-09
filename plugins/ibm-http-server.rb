##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "IBM-HTTP-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-25
  # v0.2 # 2011-01-25 # Updated version detection. 
  "Andrew Horton", # v0.3 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
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

