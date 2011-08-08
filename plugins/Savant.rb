##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Savant" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "Savant is a freeware open source web server that runs on Windows 9x, ME, NT, 2000, and XP. - Homepage: http://savant.sourceforge.net/"

# ShodanHQ results as at 2011-08-06 #
# 65 for Savant

# Examples #
examples %w|
213.114.248.201
114.212.200.19
96.30.38.147
134.169.16.243
219.88.101.105
66.76.142.146
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Savant\/([^\s]+)$/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

