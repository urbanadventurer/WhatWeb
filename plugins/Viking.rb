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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Viking\/([^\s]{1,15})/) } if @headers["server"] =~ /^Viking\/([^\s]{1,15})$/

	# Return Passive Matches
	m
end

end


