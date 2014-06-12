##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "IBM-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.2"
description "IBM HTTP Server is based on the Apache HTTP Server (httpd.apache.org), developed by the Apache Software Foundation. IBM HTTP Server can be remotely administered and configured using the WebSphere administrative console - Homepage: http://www.ibm.com/software/webservers/httpservers/"

# ShodanHQ results as at 2010-10-25 #
# 23,022 for "Server: IBM_HTTP_Server"
# 34 for "srvrname:"



# Passive #
def passive
	m=[]

	# Server HTTP Header
	m << { :version=>@headers["server"].scan(/[\s]*IBM-HTTP-Server\/([\d\.]+)/) } if @headers["server"] =~ /[\s]*IBM-HTTP-Server\/([\d\.]+)[^\r^\n]*/
	m << { :version=>@headers["server"].scan(/[\s]*IBM_HTTP_Server\/([\d\.]+)/) } if @headers["server"] =~ /[\s]*IBM_HTTP_Server\/([\d\.]+)[^\r^\n]*/
	m << { :name=>"IBM_HTTP_Server" } if @headers["server"].to_s =~ /^[\s]*IBM_HTTP_Server/

	# srvrname HTTP Header
	m << { :string=>@headers["srvrname"].to_s } unless @headers["srvrname"].nil?

	# Return passive matches
	m

end

end

