##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-XSS-Protection" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "This plugin retrieves the X-XSS-Protection value from the HTTP header. - More Info: http://msdn.microsoft.com/en-us/library/cc288472%28VS.85%29.aspx"

# 6688 ShodanHQ results for X-XSS-Protection -mode @ 2011-01-08
# 9633 ShodanHQ results for X-XSS-Protection mode @ 2011-01-08
# 9633 ShodanHQ results for X-XSS-Protection mode=block @ 2011-01-08

# Examples #
examples %w|
74.125.167.69
74.125.113.81
209.85.157.43
113.21.241.66
74.125.210.231
74.125.160.23
74.125.77.132
173.194.0.215
173.194.24.201
221.120.218.7
204.92.112.85
65.54.205.13
174.36.41.108
89.253.241.95
65.54.186.18
217.69.130.196
128.104.236.11
217.69.128.87
109.232.193.45
109.232.193.87
|

# Passive #
def passive
	m=[]

	# X-XSS-Protection HTTP Header
	m << { :string=>@meta["x-xss-protection"].to_s } unless @meta["x-xss-protection"].nil?

	m

end

end

