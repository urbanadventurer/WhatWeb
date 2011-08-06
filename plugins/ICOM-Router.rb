##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ICOM-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "ICOM Router [Japanese] - Homepage: http://www.icom.co.jp/"

# ShodanHQ results as at 2011-08-06 #
# 343 for Icom HTTP Server
# 243 for Icom HTTP Server Authenticate

# Examples #
examples %w|
203.191.223.189
163.139.186.17
116.91.36.115
133.80.42.191
133.51.6.5
202.73.220.147
202.73.220.146
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @meta["server"] =~ /^Icom HTTP Server\/([^\s]+)$/
		m << { :version=>"#{$1}" }

		# Model Detection # WWW-Authenticate Header
		if @meta["www-authenticate"] =~ /Basic realm="([^\s^"]+)"/
			m << { :model=>"#{$1}" }
		end

	end

	# Return passive matches
	m
end
end

