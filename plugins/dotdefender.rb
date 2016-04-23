##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "dotDefender" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "dotDefender is the market-leading software Web Application Firewall (WAF). dotDefender boasts enterprise-class security, advanced integration capabilities, easy maintenance and low total cost of ownership (TCO)."
website "http://www.applicure.com/"

# ShodanHQ results as at 2011-04-08 #
# 6 for dotDefender

# Passive #
def passive
	m=[]

	# X-dotDefender-denied Header
	m << { :string=>"Denied" } unless @headers["x-dotdefender-denied"].nil?

	# Return passive matches
	m
end

end

