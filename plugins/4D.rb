##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "4D" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "In one integrated environment, 4D lets you harness the power of a formidable database engine, design world class applications, and get them into your users' hands. - Homepage: http://www.4d.com/products.html"

# ShodanHQ results as at 2011-04-11 #
# 431 for 4D_v11_SQL

# Examples #
examples %w|
60.164.175.210
62.176.230.120
128.227.160.179
205.221.40.10
88.37.190.35
130.238.222.35
208.105.173.250
216.139.201.206
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^4D_v[\d]{1,2}_SQL\/([\d\.]+)$/) } if @meta["server"] =~ /^4D_v[\d]{1,2}_SQL\/([\d\.]+)$/

	# Return passive matches
	m
end

end

