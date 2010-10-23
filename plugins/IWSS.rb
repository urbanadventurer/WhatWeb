##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IWSS-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "IWSS Proxy server"

# About 270 ShodanHQ results for Proxy-agent:IWSS @ 2010-10-23
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

# Extract version # HTTP Header
def passive
	m=[]
	if @meta["Proxy-Agent"].to_s =~ /^[\s]*IWSS/ or @meta["proxy-agent"].to_s =~ /^[\s]*IWSS/
		m << { :name=>"HTTP Header" }
	end
	m
end

end

