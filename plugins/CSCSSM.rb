##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CSCSSM" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "CSCSSM Proxy server"

# About 117 ShodanHQ results for Proxy-agent:CSCSSM @ 2010-10-23
examples %w|
121.242.158.211
12.6.226.98
209.206.144.235
12.157.137.21
220.110.252.55
63.198.104.32
74.143.243.168
|

# HTTP Header
def passive
	m=[]
	if @meta["Proxy-Agent"].to_s =~ /^[\s]*CSCSSM/ or @meta["proxy-agent"].to_s =~ /^[\s]*CSCSSM/
		m << { :name=>"HTTP Header" }
	end
	m
end

end

