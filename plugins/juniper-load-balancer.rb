##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-19 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
Plugin.define "Juniper-Load-Balancer" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "Juniper Networks Application Acceleration and Load Balancing Platforms"
website "http://juniper.net/ - Note: This will slow down your web app pentest scanning. Use only manual fuzzing with time throttling."



# Passive #
def passive
	m=[]

	# Cookie
	m << {:name=>"cookie (rl-sticky-key)" } if @headers["set-cookie"] =~ /rl\-sticky\-key/i

	# Via HTTP Header
	if @headers["via"] =~ /Juniper Networks Application Acceleration Platform/i

		m << {:name=>"via header" }

		# Version Detection # Via HTTP Header
		if @headers['via'] =~ /Juniper Networks Application Acceleration Platform \- ([^<^\)]+)/i
			m << { :version=>@headers['via'].scan(/Juniper Networks Application Acceleration Platform \- ([^<^\)]+)/i) }
		end

	end    

	# Return passive matches
	m
end


end


