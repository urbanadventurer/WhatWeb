##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Covalent-Enterprise-Ready-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "The Covalent Enterprise Ready Server is a stand-alone, manually-managed instance of an Apache 2.0 Web server with Covalent extensions. - Homepage: http://www.covalent.net/resource/documentation/ers/2.1.0/HTML/InstallGuide/installers.html"
# Product guide: http://www.covalent.net/resource/documentation/ers/2.4.0/ers-2.4.0-ProductGuide.pdf

# ShodanHQ results as at 2011-05-12 #
# 160 for CovalentSNMP
# 62 for secured_by_Covalent

# Examples #
examples %w|
198.36.93.130
198.36.93.146
207.106.112.166
206.210.19.158
198.36.93.132
198.36.93.140
198.36.93.143
198.36.93.156
207.106.5.218
65.215.0.183
203.197.197.110
195.76.0.112
151.204.181.149
12.23.29.100
67.220.217.164
70.169.86.24
68.142.181.164
203.197.197.114
208.111.150.75
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/secured_by_Covalent\/([^\s]+)/) } if @meta["server"] =~ /secured_by_Covalent\/([^\s]+)/

	# CovalentSNMP
	m << { :module=>@meta["server"].scan(/(CovalentSNMP\/[^\s]+)/) } if @meta["server"] =~ /CovalentSNMP\/[^\s]+/

	# Return passive matches
	m
end

end

