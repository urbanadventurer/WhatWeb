##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Polycom-SoundPoint" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Polycom SoundPoint VOIP phone - Homepage: http://www.polycom.com/products/voice/desktop_solutions/soundpoint/"

# ShodanHQ results as at 2011-03-14 #
# 6,474 for Polycom SoundPoint IP Telephone HTTPd

# Examples #
examples %w|
207.228.51.194
72.244.162.86
75.186.59.227
81.0.197.178
142.58.0.212
66.37.236.211
24.238.7.127
27.1.25.6
148.210.125.59
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^Polycom SoundPoint IP Telephone HTTPd$/

	# Return passive matches
	m

end

end

