##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-12 #
# Updated regex match
##
Plugin.define "CSCSSM" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "CSCSSM Proxy server"

# ShodanHQ results as at 2010-10-23
# 117 for Proxy-agent:CSCSSM

# Examples #
examples %w|
121.242.158.211
12.6.226.98
209.206.144.235
12.157.137.21
220.110.252.55
63.198.104.32
74.143.243.168
|

# Passive #
def passive
	m=[]

	# Proxy-Agent HTTP Header
	m << { :name=>"Proxy-Agent HTTP Header" } if @meta["proxy-agent"].to_s =~ /^[\s]*CSCSSM/
	# Return passive matches
	m
end

end

