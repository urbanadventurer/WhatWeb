##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sambar-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-06
version "0.1"
description "Sambar server is a multi-threaded, extensible application server, web server and multi-protocol proxy server with highly programmable API. It has virtual domain support (currently name based) with independent document/CGI directories, log files, and error templates. Development and support of Sambar Server has been discontinued - More Info: http://en.wikipedia.org/wiki/Sambar_Server"

# ShodanHQ results as at 2011-04-06 #
# 1,063 for SAMBAR

# Examples #
examples %w|
94.81.233.148
70.90.7.233
212.91.192.10
217.10.136.147
202.72.160.131
212.16.147.136
201.245.106.70
112.168.171.173
84.15.45.180
80.11.110.111
193.251.46.18
129.100.139.40
|

# Passive #
def passive
	m=[]

	if @headers["server"] =~ /^SAMBAR/

		# HTTP Server Header
		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@headers["server"].scan(/^SAMBAR ([\d\.]+)$/) } if @headers["server"] =~ /^SAMBAR ([\d\.]+)$/

	end

	# Return passive matches
	m
end

end

