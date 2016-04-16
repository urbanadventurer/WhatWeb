##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "Sun web server"
website "http://www.sun.com/"

# ShodanHQ results as at 2011-08-06 #
# 10,988 for Sun-ONE-Web-Server
#     26 for Sun_WebServer
#     26 for Sun-Web-Server



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

