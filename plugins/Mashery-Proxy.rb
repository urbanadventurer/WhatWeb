##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mashery-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The Mashery proxy is our patent pending software that sits between your developers and your API. The proxy intercepts all calls to your API, does some Mashery magic, passes the call on to your API, intercepts the response, does some more Mashery magic and sends the response back to the caller. The proxy is the mechanism for applying the business rules of your choosing to your new API channel. - Homepage: http://support.mashery.com/SolutionOverview"

# ShodanHQ results as at 2011-03-14 #
# 92 for Mashery Proxy
# 78 for X-Mashery-Error-Code

# Examples #
examples %w|
support.mashery.com
developer.mashery.com
developer.netflix.com
developer.nytimes.com
developer.trulia.com
50.16.233.119
64.94.14.23
64.94.14.13
64.94.14.15
64.94.14.17
64.94.14.18
64.94.14.19
64.94.14.22
64.94.14.23
64.94.14.24
64.94.14.25
174.129.152.139
174.129.236.115
174.129.247.162
184.72.211.79
184.73.101.162
204.236.229.168
216.52.244.125
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^Mashery Proxy$/

	# X-Mashery-Responder
	m << { :string=>@meta["x-mashery-responder"].to_s } unless @meta["x-mashery-responder"].nil?

	# X-Mashery-Error-Code
	m << { :string=>@meta["x-mashery-error-code"].to_s } unless @meta["x-mashery-error-code"].nil?

	# Return passive matches
	m

end

end

