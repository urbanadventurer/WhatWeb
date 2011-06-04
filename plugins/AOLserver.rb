##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AOLserver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "AOLserver is America Online's Open-Source web server. AOLserver is the backbone of the largest and busiest production environments in the world. AOLserver is a multithreaded, Tcl-enabled web server used for large scale, dynamic web sites. - Homepage: http://www.aolserver.com/"
# Source: http://aolserver.github.com/

# ShodanHQ results as at 2011-06-04 #
# 34,038 for aolserver

# Examples #
examples %w|
64.156.24.32
87.25.222.20
205.188.95.114
203.74.215.21
63.241.218.35
216.39.69.174
212.25.190.161
88.55.178.43
213.180.130.110
98.97.135.109
98.99.157.237
66.80.43.146
98.98.57.173
98.96.49.70
76.2.127.200
98.97.78.137
12.71.30.50
98.97.193.45
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^AOLserver/

		m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^AOLserver$/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^AOLserver\/([^\s]+)/) } if @meta["server"] =~ /^AOLserver\/([^\s]+)/

	end

	# Return passive matches
	m
end

end

