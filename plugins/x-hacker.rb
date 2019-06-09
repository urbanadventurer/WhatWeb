##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "x-hacker"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-08
]
version "0.1"
description "This plugin identifies the X-Hacker HTTP header and returns its value."

# ShodanHQ results as at 2011-04-08 #
# 23 for x-hacker



# Passive #
passive do
	m=[]
	
	# X-Hacker HTTP Header
	m << { :string=>@headers["x-hacker"] } unless @headers["x-hacker"].nil?

	# Return passive matches
	m
end

end

