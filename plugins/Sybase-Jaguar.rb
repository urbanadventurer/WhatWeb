##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sybase-Jaguar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Sybase Jaguar server - discontinued - Homepage: http://www.sybase.com/products/archivedproducts/jaguarcts"

# ShodanHQ results as at 2011-07-27 #
# 468 for Server: Jaguar Server Version

# Examples #
examples %w|
140.134.131.96
199.193.10.86
199.193.13.53
168.243.1.83
120.125.96.143
192.83.194.205
222.122.70.252
192.87.31.188
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Jaguar Server Version ([\d\.]+)$/) } if @headers["server"] =~ /^Jaguar Server Version ([\d\.]+)$/

	# Return passive matches
	m
end
end

