##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ethProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-13
version "0.1"
description "ethProxy DDoS (Distributed Denial of Service) Proxy solution offers full DDoS protection for a wide-range of HTTP-based attacks without changing providers. Web traffic is filtered through the ethProxy systems and routed back to your host. - Homepage: http://www.ethproxy.com/"

# ShodanHQ results as at 2011-05-13 #
# 80 for ethProxy

# Examples #
examples %w|
199.59.164.43
204.74.219.48
208.64.124.245
208.64.124.203
74.86.128.204
74.86.128.194
74.82.171.188
67.228.68.195
208.64.124.101
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^ethProxy$/

	# Return passive matches
	m
end

end

