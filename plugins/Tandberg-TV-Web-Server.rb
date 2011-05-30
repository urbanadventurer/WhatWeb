##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tandberg-TV-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Tandberg - Video Conferencing Solutions and Telepresence Products - Homepage: http://www.tandberg.com/"

# ShodanHQ results as at 2011-05-30 #
# 154 for Tandberg Television Web server

# Examples #
examples %w|
68.185.18.114
72.21.89.214
80.109.134.172
65.15.147.82
211.58.113.98
70.91.146.215
70.91.146.212
64.119.40.42
|

# Passive #
def passive
	m=[]

	# HTTP Server Header or HTTP "Server " Header
	if @meta["server"] =~ /^Tandberg Television Web server$/ or @meta["server "] =~ /^Tandberg Television Web server$/
		m << { :name=>"HTTP Server Header" }
	end

	# Return passive matches
	m
end

end

