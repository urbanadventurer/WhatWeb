##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SonicWALL-SSL-VPN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "SonicWALL SSL-VPN Portal provides secure Internet access for remote users to log in and access private network resources via SSL-VPN technology.  - Homepage: http://www.sonicwall.com/"

# ShodanHQ results as at 2011-03-13 #
# 11,960 for SonicWALL SSL-VPN Web Server

# Examples #
examples %w|
12.192.121.70
217.108.93.178
67.138.161.28
66.240.162.31
128.46.88.201
77.67.53.101
133.105.9.9
64.115.151.157
213.249.130.58
212.30.17.75
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^SonicWALL SSL-VPN Web Server[.]?$/

	# Return passive matches
	m

end

end

