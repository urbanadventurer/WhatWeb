##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Viking" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "Viking is an all-in-one server that provides everything from HTTP and FTP to Gopher, IRC, and NTP; with firewalling, proxying and more - Homepage: http://www.robtex.com/viking.html"

# ShodanHQ results as at 2011-03-07 #
# 22 for Viking -realm -apache -IIS

# Examples #
examples %w|
192.24.251.35
71.246.241.10
217.207.105.19
83.64.71.86
200.81.199.142
70.50.230.13
75.87.145.62
192.24.251.34
217.207.105.23
80.120.174.12
66.212.170.98
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Viking\/([^\s]{1,15})/) } if @meta["server"] =~ /^Viking\/([^\s]{1,15})$/

	# Return Passive Matches
	m
end

end


