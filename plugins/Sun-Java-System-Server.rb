##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-30 #
# Updated version detection
# Added Application Server version detection
##
Plugin.define "Sun-Java-System-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "Sun Java System Web/Proxy Server. - homepage: http://developers.sun.com/appserver/"

# ShodanHQ results as at 2010-10-23 #
# 2722 results for Server: Sun-Java-System-Web-Server
# 252 results for Proxy-agent: Sun-Java-System-Web-Proxy-Server
# 202 for Proxy-agent: Sun-Java-System-Web-Server

# Examples #
examples %w|
140.110.17.152
210.210.24.157
217.160.172.47
209.144.27.154
199.0.172.38
186.160.40.182
164.80.64.80
41.223.73.83
213.214.145.186
202.126.221.115
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

# Passive #
def passive
	m=[]

	# Version Detection # Proxy-Agent
	if @meta["proxy-agent"].to_s =~ /^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/
		m << { :version=>@meta["proxy-agent"].scan(/^[\s]*Sun-Java-System-Web-[Proxy-]*Server\/([\d\.]+)/).to_s, :module=>"Proxy Server" }
	end

	# Version Detection # Web Server
	if @meta["server"].to_s =~ /^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/
		m << { :version=>@meta["server"].scan(/^[\s]*Sun-Java-System-Web-Server\/([\d\.]+)/).to_s, :module=>"Web Server" }
	end

	# Version Detection # Application Server
	if @meta["server"].to_s =~ /^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server/
		if @meta["server"].to_s =~ /^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server ([\d\._]+)/
			m << { :version=>@meta["server"].scan(/^[\s]*Sun[\-\ ]{1}Java[\-\ ]{1}System[\/\ ]{1}Application[\-\ ]{1}Server ([\d\._]+)/), :module=>"Application Server" }
		else
			m << { :name=>"HTTP server header", :module=>"Application Server" }
		end

	end

	# Return passive results
	m
end

end

