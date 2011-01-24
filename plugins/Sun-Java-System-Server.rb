##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sun-Java-System-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "Sun Java System Web/Proxy Server."

# About 2722 ShodanHQ results for Server: Sun-Java-System-Web-Server
# About 252 ShodanHQ results for Proxy-agent: Sun-Java-System-Web-Proxy-Server
# About 202 ShodanHQ results for Proxy-agent: Sun-Java-System-Web-Server
examples %w|
195.149.136.48
147.235.246.179
163.29.241.127
194.224.88.176
194.224.88.151
78.110.27.149
195.149.136.22
212.47.10.218
192.9.53.211
194.224.88.196
163.29.241.127
193.145.164.250
41.208.2.193
213.161.81.121
137.254.16.45
194.224.88.151
192.18.97.87
137.254.16.93
137.254.16.98
137.254.16.92
198.189.14.99
216.74.188.167
216.74.188.141
209.114.79.35
216.35.172.66
144.140.192.20
216.74.188.165
201.193.44.155
208.243.0.213
|

# Extract version # HTTP Header
def passive
	m=[]

	# Proxy-Agent
	if @meta["Proxy-Agent"].to_s =~ /^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/
		m << { :version=>@meta["Proxy-Agent"].scan(/^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/).to_s, :module=>"Proxy" }
	end
	if @meta["proxy-agent"].to_s =~ /^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/
		m << { :version=>@meta["proxy-agent"].scan(/^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/).to_s, :module=>"Proxy" }
	end

	# Server
	if @meta["Server"].to_s =~ /^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/
		m << { :version=>@meta["Server"].scan(/^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/).to_s, :module=>"Web" }
	end
	if @meta["server"].to_s =~ /^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/
		m << { :version=>@meta["server"].scan(/^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/).to_s, :module=>"Web" }
	end

	m

end

end

