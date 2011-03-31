##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Velazquez" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-31
version "0.1"
description "Velazquez HTTP Server"

# ShodanHQ results as at 2011-03-13 #
# 293 for Velazquez

# Examples #
examples %w|
88.2.217.224
212.183.200.34
212.79.147.142
213.96.101.160
88.2.126.83
85.155.129.145
85.112.29.238
83.36.55.184
212.145.45.233
212.166.242.62
80.37.128.28
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Velazquez ([\d\.]+)$/) } if @meta["server"] =~ /^Velazquez ([\d\.]+)$/

	# Return passive matches
	m
end

end

