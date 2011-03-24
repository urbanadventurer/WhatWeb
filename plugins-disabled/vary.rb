##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vary" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "This plugin extracts the value for the vary HTTP header. This is rarely useful however it does identify websites which filter based on the user-agent if 'user-agent' is present in the vary header. The vary HTTP header tells downstream proxies how to match future request headers to decide whether the cached response can be used rather than requesting a fresh one from the origin server. - More info: http://tools.ietf.org/html/rfc2616"

# ShodanHQ results as at 2011-03-24 #
# 237,111   for vary User-Agent
# 1,710,678 for vary

# Examples #
examples %w|
64.13.205.139
66.201.116.247
213.184.129.120
186.216.132.109
64.38.60.194
212.34.133.145
94.23.214.43
209.157.71.203
78.41.206.129
195.88.202.151
|

# Passive #
def passive
	m=[]

	# Vary HTTP Header
	m << { :string=>@meta["vary"].to_s } unless @meta["vary"].nil?

	# Return passive matches
	m
end

end

