##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RealVNC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "RealVNC provides remote control software which lets you see and interact with desktop applications across any network. - Homepage: http://www.realvnc.com/"

# ShodanHQ results as at 2011-03-13 #
# 872 for RealVNC

# Examples #
examples %w|
203.97.47.165
192.38.75.22
82.111.228.33
78.41.155.141
195.37.93.222
199.87.231.67
81.110.136.168
200.21.65.2
109.91.83.103
128.119.70.201
207.179.177.156
85.175.153.214
213.106.149.167
174.142.180.135
212.100.132.188
174.142.140.129
70.91.141.178
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^RealVNC\/(.+)$/) } if @meta["server"] =~ /^RealVNC\/(.+)$/

	# Return passive matches
	m

end

end

