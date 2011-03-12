##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "xproxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "xproxy"

# ShodanHQ results as at 2011-03-13 #
# 94 for xproxy -apache -IIS -nginx port:80
# Most results are from Japan

# Examples #
examples %w|
210.141.158.29
121.111.236.196
202.214.74.68
58.138.139.204
211.4.195.177
202.214.74.64
210.164.31.184
121.111.236.197
202.214.74.47
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^xproxy\/([^\(]+)\([\d]+\)$/) } if @meta["server"] =~ /^xproxy\/([^\(]+)\([\d]+\)$/

	# Date Detection # HTTP Server Header
	m << { :string=>@meta["server"].scan(/^xproxy\/[^\(]+\(([\d]+)\)$/) } if @meta["server"] =~ /^xproxy\/[^\(]+\(([\d]+)\)$/

	# Return passive matches
	m

end

end

