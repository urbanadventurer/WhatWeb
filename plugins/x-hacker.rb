##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-hacker" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "This plugin identifies the X-Hacker HTTP header and returns its value."

# ShodanHQ results as at 2011-04-08 #
# 23 for x-hacker

# Examples #
examples %w|
http://65.52.171.29/
http://174.129.224.213/
http://208.69.177.248/
http://72.52.210.91/
http://184.73.3.92/
http://38.99.89.248/
|

# Passive #
def passive
	m=[]
	
	# X-Hacker HTTP Header
	m << { :string=>@headers["x-hacker"] } unless @headers["x-hacker"].nil?

	# Return passive matches
	m
end

end

