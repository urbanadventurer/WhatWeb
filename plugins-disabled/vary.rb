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



# Passive #
def passive
	m=[]

	# Vary HTTP Header
	m << { :string=>@headers["vary"].to_s } unless @headers["vary"].nil?

	# Return passive matches
	m
end

end

