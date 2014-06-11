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



# Passive #
def passive
	m=[]

	# Proxy-Authenticate HTTP Header
	m << { :string=>@headers["proxy-authenticate"].scan(/realm="([^"]+)"/i).flatten } if @headers["proxy-authenticate"] =~ /realm="([^"]+)"/i

	m
end

end

