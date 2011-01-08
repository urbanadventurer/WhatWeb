##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Frame-Options" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "This plugin retrieves the X-Frame-Options value from the HTTP header. - More Info: http://msdn.microsoft.com/en-us/library/cc288472%28VS.85%29.aspx"

# About 10478 ShodanHQ results for X-Frame-Options @ 2011-01-08
# About 9672 ShodanHQ results for X-Frame-Options SameOrigin @ 2011-01-08
# About 490 ShodanHQ results for X-Frame-Options Deny @ 2011-01-08

# Examples #
examples %w|
65.54.205.13
216.48.124.51
65.185.110.127
178.77.98.66
91.207.100.113
204.236.233.47
69.38.204.41
217.112.190.187
113.61.108.5
124.108.121.182
162.127.33.1
213.21.163.37
66.206.86.137
60.36.187.197
59.148.237.98
90.0.216.166
71.62.59.52
213.238.3.78
66.93.137.36
86.43.79.253
|

# Passive #
def passive
	m=[]

	# X-Frame-Options HTTP Header
	m << { :string=>@meta["x-frame-options"].to_s } unless @meta["x-frame-options"].nil?

	m

end

end

