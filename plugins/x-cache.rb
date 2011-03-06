##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Cache" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-30
version "0.1"
description "This plugin identifies the X-Cache HTTP header and extracts the value."

# ShodanHQ results as at 2011-01-30 #
#  3,883 for x-cache-Lookup -squid
# 59,766 for x-cache
# 95,263 for x-cache-Lookup

# Examples #
examples %w|
206.16.221.38
210.51.19.56
206.212.250.243
90.182.150.210
187.29.17.118
140.123.27.158
204.27.58.10
216.130.181.94
178.162.156.54
140.123.27.158
46.51.170.46
83.13.75.166
146.186.189.209
208.83.233.115
216.169.110.15
61.114.229.110
193.93.125.228
205.207.146.155
91.203.186.49
|

# Passive #
def passive
	m=[]

	# X-Cache
	if @meta["x-cache"] =~ /(MISS|HIT|NONE) from ([^\r^\n]{1,128})/
		@meta["x-cache"].each do |x_cache|
		m << { :string=>x_cache.to_s.scan(/ from ([^\r^\n]{1,128})/) }
		end
	end

	# X-Cache-Lookup
	if @meta["x-cache-lookup"] =~ /(MISS|HIT|NONE) from ([^\r^\n]{1,128})/
		@meta["x-cache-lookup"].each do |x_cache|
		m << { :string=>x_cache.to_s.scan(/ from ([^\r^\n]{1,128})/) }
		end
	end

	# Return passive matches
	m

end

end

