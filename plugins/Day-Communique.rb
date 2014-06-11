##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Day-Communique" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "Day Communique (CQ5) WCM is a web content management system based on CRX for the content repository and Apache Sling as a web framework. Day Content Repository Extreme (Day CRX) is a content repository that implements the content repository API for Java (JSR-170). It is based on the open source reference implementation Apache Jackrabbit and serves as the foundation of all other products by Day Software. - Homepage: http://www.day.com/"
# More Info: http://en.wikipedia.org/wiki/Day_Software

# ShodanHQ results as at 2011-06-04 #
# 246 for Communique



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /Communique\/([^\s]+)/

		# Version Detection
		if @headers["server"] =~ /Communique\/([^\s]+ \([^\)]+\))/
			m << { :version=>@headers["server"].scan(/Communique\/([^\s]+ \([^\)]+\))/) }
		else
			m << { :version=>@headers["server"].scan(/Communique\/([^\s]+)/) }
		end

	end

	# Return passive matches
	m
end

end

