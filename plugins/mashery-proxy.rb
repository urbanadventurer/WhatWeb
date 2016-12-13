##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mashery-Proxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The Mashery proxy is our patent pending software that sits between your developers and your API. The proxy intercepts all calls to your API, does some Mashery magic, passes the call on to your API, intercepts the response, does some more Mashery magic and sends the response back to the caller. The proxy is the mechanism for applying the business rules of your choosing to your new API channel."
website "http://support.mashery.com/SolutionOverview"

# ShodanHQ results as at 2011-03-14 #
# 92 for Mashery Proxy
# 78 for X-Mashery-Error-Code



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^Mashery Proxy$/

	# X-Mashery-Responder
	m << { :string=>@headers["x-mashery-responder"].to_s } unless @headers["x-mashery-responder"].nil?

	# X-Mashery-Error-Code
	m << { :string=>@headers["x-mashery-error-code"].to_s } unless @headers["x-mashery-error-code"].nil?

	# Return passive matches
	m

end

end

