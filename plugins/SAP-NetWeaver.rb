##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SAP-NetWeaver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.1"
description "SAP NetWeaver provides the technical foundation for SAP applications. In addition, it delivers a portfolio of enterprise technology that allows you to extend your applications to reach more people and to adopt new processes, devices, and consumption models. - Homepage: http://www.sap.com/platform/netweaver/index.epx"
# More info: http://en.wikipedia.org/wiki/SAP_NetWeaver_Application_Server

# Google results as at 2011-03-10 #
# 100 results for intitle:"Logon - SAP Web Application Server"

# ShodanHQ results as at 2011-03-10 #
# 710 for SAP Web Application Server
# 363 for SAP netweaver
# 619 for SAP J2EE Engine

# Examples #
examples %w|
199.64.216.139
194.113.76.79
12.188.126.54
199.61.16.54
212.190.195.36
151.99.198.89
194.40.232.60
217.150.153.22
193.164.238.161
167.232.242.91
80.150.67.55
195.145.9.229
213.157.30.35
163.164.64.64
218.159.195.130
83.128.26.129
161.226.205.152
83.242.194.42
152.73.7.190
193.222.224.125
200.31.80.139
122.55.79.165
190.228.147.169
61.251.161.70
192.137.89.30
167.232.242.90
58.56.128.66
213.206.233.34
190.196.1.64
|

# Passive #
def passive
	m=[]

	# Application Server
	if @meta["server"] =~ /^SAP (Web|NetWeaver) Application Server/

		# Server Detection
		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :string=>@meta["server"].scan(/^SAP (Web|NetWeaver) Application Server [\/]?[\ ]?[\(]?([^\)^\r^\n]+)[\)]?/)[0][1] } if @meta["server"] =~ /^SAP (Web|NetWeaver) Application Server [\/]?[\ ]?[\(]?([^\)^\r^\n]+)[\)]?/

	end

	# J2EE Engine
	m << { :module=>"J2EE", :version=>@meta["server"].scan(/^SAP J2EE Engine\/([\d\.]{1,4})/).to_s } if @meta["server"] =~ /^SAP J2EE Engine\/([\d\.]{1,4})/

	# Return passive matches
	m
end

end

