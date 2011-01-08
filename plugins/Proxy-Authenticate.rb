##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Proxy-Authenticate" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-09
version "0.1"
description "This plugin extracts the realm from the proxy-authenticate HTTP header."

# About 1402 ShodanHQ results for proxy-authenticate @ 2011-01-09

# Examples #
examples %w|
196.23.54.97
92.255.238.196
178.86.6.223
178.86.6.225
146.47.39.143
|

# Passive #
def passive
	m=[]

	# Proxy-Authenticate HTTP Header
	m << { :string=>@meta["proxy-authenticate"].scan(/realm="([^"]+)"/i).to_s } if @meta["proxy-authenticate"] =~ /realm="([^"]+)"/i

	m
end

end

