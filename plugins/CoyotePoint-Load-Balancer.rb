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

# Examples #
examples %w|
202.55.99.36
61.206.36.232
199.108.228.204
72.35.9.180
|

# Passive #
def passive
	m=[]

	# Model Detection # HTTP Server Header
	m << { :model=>@meta["server"].scan(/^CoyotePoint (L[\d]) Load Balancer$/) } if @meta["server"] =~ /^CoyotePoint (L[\d]) Load Balancer$/

	# Return passive matches
	m
end

end

