##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CoyotePoint-Load-Balancer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "CoyotePoint load balancing device - Homepage: http://www.coyotepoint.com/products/"

# ShodanHQ results as at 2011-05-16 #
# 11 for CoyotePoint



# Passive #
def passive
	m=[]

	# Model Detection # HTTP Server Header
	m << { :model=>@headers["server"].scan(/^CoyotePoint (L[\d]) Load Balancer$/) } if @headers["server"] =~ /^CoyotePoint (L[\d]) Load Balancer$/

	# Return passive matches
	m
end

end

