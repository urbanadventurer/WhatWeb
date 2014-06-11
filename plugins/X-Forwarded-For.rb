##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Forwarded-For" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-07
version "0.1"
description "This plugin extracts the proxy server details from the X-Forwarded-For param of the HTTP header. X-Forwarded-For is a non-standard header introduced by the developers of the Squid proxy before the Via header was added to HTTP."

# ShodanHQ results as at 2011-04-07 #
# 110 for X-Forwarded-For



# Passive #
def passive
	m=[]

	# Via HTTP header
	m << { :string=>@headers["x-forwarded-for"].to_s } unless @headers["x-forwarded-for"].nil?

	# Return passive matches
	m
end

end

