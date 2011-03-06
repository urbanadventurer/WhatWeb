##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-iPlanet" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "Oracle-iPlanet Web Server and Proxy Server."

# About 62 ShodanHQ results for Server:iPlanet-Web-Server
# About 277 ShodanHQ results for Proxy-agent:iPlanet-Web-Proxy-Server
# 8 ShodanHQ results for Server:iPlanet-WebServer-Enterprise
# About 51 ShodanHQ results for Server:Oracle-iPlanet-Web-Server
examples %w|
47.234.44.129
47.234.58.33
81.209.150.32
195.55.102.7
198.246.152.165
198.246.152.101
198.246.152.102
198.246.152.103
198.246.152.104
198.246.152.105
198.246.152.106
198.246.152.107
198.246.152.108
198.246.152.109
198.246.151.173
198.246.151.174
198.246.151.175
198.246.151.176
198.246.151.177
198.246.151.178
198.246.151.179
198.246.151.196
198.246.152.102
198.246.152.207
198.246.151.208
198.246.151.219
198.246.152.165
202.187.241.236
203.106.238.115
200.38.95.69
200.38.95.100
200.38.95.150
200.38.95.177
200.38.95.192
200.38.95.194
200.38.95.216
200.38.95.227
200.38.95.235
202.187.45.115
202.187.241.232
202.187.241.236
202.187.241.243
202.187.241.250
202.224.10.3
203.106.238.115
|

# Extract version # HTTP Header
def passive
	m=[]

	# Proxy-Agent
	if @meta["proxy-agent"].to_s =~ /^[\s]*iPlanet-Web-Proxy-Server\/([\d\.]+)/
		m << { :version=>@meta["proxy-agent"].scan(/^[\s]*iPlanet-Web-Proxy-Server\/([\d\.]+)/).to_s, :module=>"Proxy" }
	end

	# Server
	if @meta["server"].to_s =~ /^[\s]*iPlanet-WebServer-Enterprise\/([\d\.]+)/
		m << { :version=>@meta["server"].scan(/^[\s]*iPlanet-WebServer-Enterprise\/([\d\.]+)/).to_s, :module=>"Web" }
	end
	if @meta["server"].to_s =~ /^[\s]*Oracle-iPlanet-Web-Server\/([\d\.]+)/
		m << { :version=>@meta["server"].scan(/^[\s]*Oracle-iPlanet-Web-Server\/([\d\.]+)/).to_s, :module=>"Web" }
	end

	m

end

end

