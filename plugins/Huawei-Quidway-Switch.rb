##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Huawei-Quidway-Switch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Huawei network switch - Quidway series - Homepage: http://www.huawei.com/products/datacomm/catalog.do?id=16"

# ShodanHQ results as at 2011-08-07 #
# 103,440 for Lanswitch
# 103,166 for Lanswitch HttpServer

# Examples #
examples %w|
124.114.235.145
84.14.134.218
113.195.135.38
110.93.195.197
200.222.73.2
221.131.22.107
222.169.175.210
222.28.255.20
219.143.28.76
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Lanswitch - V([\d]{3})R([\d]{3}) HttpServer [\d\.]+$/
		m << { :version=>"#{$1}r#{$2}" }
	end

	# Return passive matches
	m
end
end

