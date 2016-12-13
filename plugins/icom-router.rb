##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ICOM-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "ICOM Router [Japanese]"
website "http://www.icom.co.jp/"

# ShodanHQ results as at 2011-08-06 #
# 343 for Icom HTTP Server
# 243 for Icom HTTP Server Authenticate



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Icom HTTP Server\/([^\s]+)$/
		m << { :version=>"#{$1}" }

		# Model Detection # WWW-Authenticate Header
		if @headers["www-authenticate"] =~ /Basic realm="([^\s^"]+)"/
			m << { :model=>"#{$1}" }
		end

	end

	# Return passive matches
	m
end
end

