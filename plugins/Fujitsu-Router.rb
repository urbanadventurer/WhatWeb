##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fujitsu-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "Fujitsu-Router - Homepage: http://fujitsu.com/"

# ShodanHQ results as at 2011-03-11 #
# All results as are from Japan
# 68 for Si-R220B
# 11 for Si-R570
# 88 for Si-R80brin
# 109 for Si-R180B
# 302 for Si-R170

# Examples #
examples %w|
202.87.239.6
60.32.156.129
60.36.182.145
61.215.227.254
211.19.36.243
150.59.33.16
211.12.49.238
203.140.143.30
210.228.77.129
211.5.254.145
118.159.247.193
202.248.109.96
118.155.202.202
133.54.214.6
210.155.22.3
210.164.136.17
202.248.170.130
202.248.109.242
61.122.57.197
218.40.111.77
61.122.57.205
61.122.57.223
121.83.219.130
114.160.120.2
61.123.37.192
220.254.203.251
61.122.57.178
61.122.57.206
202.229.225.4
125.206.222.41
220.110.38.49
211.0.201.50
61.199.198.241
220.221.255.188
219.118.245.224
218.44.154.169
219.166.59.25
210.135.201.241
210.236.171.177
202.248.41.233
211.16.107.120
202.41.215.57
202.248.29.225
114.144.75.59
118.14.218.72
219.119.139.189
221.186.154.174
|

# Passive #
def passive
	m=[]

	# Model Detection # HTTP Server Header
	m << { :model=>@meta["server"].scan(/^(Si-[A-Za-z\d]{4,10})$/) } if @meta["server"] =~ /^Si-[A-Za-z\d]{4,10}$/

	# Return passive matches
	m
end

end


