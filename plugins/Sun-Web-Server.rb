##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "Sun web server - Homepage: http://www.sun.com/"

# ShodanHQ results as at 2011-08-06 #
# 10,988 for Sun-ONE-Web-Server
#     26 for Sun_WebServer
#     26 for Sun-Web-Server

# Examples #
examples %w|
204.78.50.87
62.239.7.197
165.65.35.38
200.14.130.66
222.66.26.207
195.97.218.30
194.224.54.147
84.18.163.14
123.111.138.192
148.177.18.91
110.4.26.131
80.64.50.231
12.173.84.47
80.64.50.209
80.64.50.219
80.64.60.145
80.64.50.208
|

# Passive #
def passive
	m=[]

	if @headers["server"] =~ /^Sun/

		# HTTP Server Header
		if @headers["server"] =~ /^Sun-Web-Server$/
			m << { :name=>"HTTP Server Header" }
		end

		# Version Detection # HTTP Server Header
		if @headers["server"] =~ /^Sun_WebServer\/([^\s]+)$/
			m << { :version=>"#{$1}" }
		end

		# Version Detection # HTTP Server Header
		if @headers["server"] =~ /^Sun-ONE-Web-Server\/([^\s]+)$/
			m << { :version=>"#{$1}" }
		end

	end

	# Return passive matches
	m
end
end

