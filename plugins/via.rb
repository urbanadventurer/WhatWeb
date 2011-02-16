##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Removed redundant @meta["Via"] match
##
Plugin.define "Via-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.2"
description "This plugin extracts the proxy server details from the Via param of the HTTP header."

# ShodanHQ results as at 2010-10-14 #
# 131,646 for "Via: "

# Examples #
examples %w|
12.149.157.79
122.152.135.214
69.175.124.85
189.126.248.229
212.89.225.173
193.91.64.43
82.94.255.126
216.162.20.34
204.188.255.72
121.121.231.174
77.242.194.157
187.29.17.226
203.56.14.244
178.238.130.197
83.147.205.234
|

# Passive #
def passive
	m=[]

	# Via HTTP header
	m << { :string=>@meta["via"].to_s } unless @meta["via"].nil?

	# Return passive matches
	m
end

end

