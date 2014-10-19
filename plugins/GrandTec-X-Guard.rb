##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GrandTec-X-Guard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "GrandTec X-Guard PC-based surveillance system"
website "http://store.grandtec.com/secsur.html"

# ShodanHQ results as at 2011-08-05 #
# 25 for WalkGuard



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^WalkGuard web server$/
		m << { :name=>"HTTP Server Header" }
	end

	# WWW-Authenticate Header
	if @headers["www-authenticate"] =~ /Basic realm="WalkGuard web server"/
		m << { :name=>"WWW-Authenticate Header" }
	end

	# Return passive matches
	m
end
end

