##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cougar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Cougar video conferencing server - Homepage: http://www.cougarconference.com/"

# ShodanHQ results as at 2011-07-27 #
# 21,987 for Cougar
# 21,026 for Cougar Supported

# Examples #
examples %w|
71.5.35.137
210.253.225.53
64.85.177.32
200.176.15.86
66.180.223.227
61.110.244.185
222.122.181.50
84.201.93.4
193.104.200.14
195.194.51.14
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Cougar\/([\d\.]+)$/) } if @meta["server"] =~ /^Cougar\/([\d\.]+)$/

	# Return passive matches
	m
end
end

