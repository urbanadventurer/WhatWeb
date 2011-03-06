##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CDN-Cache-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "CDN-Cache-Server"

# ShodanHQ results as at 2011-03-06 #
# 5,686 for Server: "Cdn Cache Server"

# Examples #
examples %w|
58.248.245.53
113.6.248.43
58.55.124.92
220.170.192.89
183.60.136.25
218.60.31.175
|

# Passive #
def passive
	m=[]

	# Server: Cdn Cache Server
	m << { :version=>@meta["server"].scan(/^Cdn Cache Server V([\d\.]+)/) } if @meta["server"] =~ /^Cdn Cache Server V([\d\.]+)/

	# Return passive matches
	m
end

end


