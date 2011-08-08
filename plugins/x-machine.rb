##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "x-machine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "This plugin identifies the x-machine and x-machine-id headers and extracts their values."

# ShodanHQ results as at 2011-04-08 #
# 285 for x-machine

# Examples #
examples %w|
205.203.139.11
216.168.135.217
205.203.131.98
216.168.135.218
216.168.135.229
65.55.69.144
216.168.135.223
205.203.139.219
67.128.208.45
216.168.135.232
50.18.62.13
198.202.148.15
198.202.148.86
|

# Passive #
def passive
	m=[]
	
	# X-Machine HTTP Header
	m << { :string=>@headers["x-machine"] } unless @headers["x-machine"].nil?

	# X-Machine-ID HTTP Header
	m << { :string=>@headers["x-machine-id"] } unless @headers["x-machine-id"].nil?

	# Return passive matches
	m

end

end

