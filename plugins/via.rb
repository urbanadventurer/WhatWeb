##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Removed redundant @headers["Via"] match
##
Plugin.define "Via-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.2"
description "This plugin extracts the proxy server details from the Via param of the HTTP header."

# ShodanHQ results as at 2010-10-14 #
# 131,646 for "Via: "



# Passive #
def passive
	m=[]

	# Via HTTP header
	m << { :string=>@headers["via"].to_s } unless @headers["via"].nil?

	# Return passive matches
	m
end

end

