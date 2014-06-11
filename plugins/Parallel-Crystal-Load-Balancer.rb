##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Parallel-Crystal-Load-Balancer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Parallel Crystal load balancing server - Homepage: http://www.dynalivery.com/products/parallelcrystal/parallelcrystal2_x.html"

# Manual: http://www.dynalivery.com/products/parallelcrystal/v2_3/V2_3Install-UsersGuide.pdf

# ShodanHQ results as at 2011-07-27 #
# 6 for Crystal2 BalancerServer



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Crystal2 BalancerServer ([\d\.]+)$/) } if @headers["server"] =~ /^Crystal2 BalancerServer ([\d\.]+)$/

	# Return passive matches
	m
end
end

