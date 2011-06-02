##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VisualRoute" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Traceroute and network diagnostic tool - Homepage: http://www.visualroute.com/"

# ShodanHQ results as at 2011-06-02 #
# 24 for VisualRoute

# Examples #
examples %w|
195.67.99.4
200.63.160.22
194.73.11.18
194.242.61.53
205.234.111.160
205.234.111.166
216.206.187.181
12.10.126.151
205.234.111.204
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^VisualRoute /

		# Version Detection
		m << { :version=>@meta["server"].scan(/^VisualRoute \((tm|R)\) ([^\s]+)$/)[0][1] } if @meta["server"] =~ /^VisualRoute \((tm|R)\) ([^\s]+)$/

		if @meta["server"] =~ /^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/
			# Edition Detection
			m << { :string=>@meta["server"].scan(/^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/)[0][1] }

			# Version Detection
			m << { :version=>@meta["server"].scan(/^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/)[0][2] }

		end

	end

	# Return passive matches
	m
end

end

