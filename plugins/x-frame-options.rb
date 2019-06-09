##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "X-Frame-Options"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-01-08
]
version "0.1"
description "This plugin retrieves the X-Frame-Options value from the HTTP header. - More Info: http://msdn.microsoft.com/en-us/library/cc288472%28VS.85%29.aspx"

# About 10478 ShodanHQ results for X-Frame-Options @ 2011-01-08
# About 9672 ShodanHQ results for X-Frame-Options SameOrigin @ 2011-01-08
# About 490 ShodanHQ results for X-Frame-Options Deny @ 2011-01-08



# Passive #
passive do
	m=[]

	# X-Frame-Options HTTP Header
	m << { :string=>@headers["x-frame-options"].to_s } unless @headers["x-frame-options"].nil?

	m

end

end

