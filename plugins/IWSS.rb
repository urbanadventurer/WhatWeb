##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-10 #
# Updated regex match
##
Plugin.define "IWSS-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "Trend Micro InterScan Web Security Suite (IWSS) Proxy server - homepage: http://us.trendmicro.com/us/products/enterprise/interscan-web-security-suite/"

# ShodanHQ results as at 2010-10-23 #
# 270 for Proxy-agent:IWSS

# Examples #
examples %w|
202.41.220.166
205.241.31.80
66.165.168.231
210.170.0.9
121.242.23.197
63.66.72.34
208.51.138.212
74.202.255.163
210.170.0.24
12.200.16.15
|

# Passive #
def passive
	m=[]

	# Proxy-Agent HTTP Header
	m << { :name=>"Proxy-Agent HTTP Header" } if @meta["proxy-agent"].to_s =~ /^[\s]*IWSS/

	# Return Passive Matches
	m
end

end

