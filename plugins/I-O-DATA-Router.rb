##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "I-O-DATA-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "I-O DATA router [Japanese] - http://www.iodata.jp/product/"

# ShodanHQ results as at 2011-08-05 #
# 413 for WN-GDN Ver
# All results are from Japan

# Google results as at 2011-08-05 #
# 8 for intitle:"I-O DATA Wireless Broadband Router"

# Dorks #
dorks [
'intitle:"I-O DATA Wireless Broadband Router"'
]

# Examples #
examples %w|
110.132.176.113
117.58.144.145
222.229.40.75
182.23.228.188
210.194.40.154
119.26.156.181
219.215.84.33
202.95.187.124
117.74.4.212
61.24.98.169
|

# Matches #
matches [

# Model Detection # Title
{ :url=>"/", :model=>/<title>I-O DATA Wireless Broadband Router (WN-[^\s^<]+)<\/title>/ },

]

# Passive #
def passive
	m=[]

	# Version + Model Detection # HTTP Server Header
	if @meta["server"] =~ /^Linux, HTTP\/1\.1, (WN-[^\s]+) Ver ([^\s]+)$/
		m << { :model  =>"#{$1}" }
		m << { :version=>"#{$2}" }
	end

	# Return passive matches
	m
end
end

