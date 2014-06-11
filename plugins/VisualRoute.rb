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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^VisualRoute /

		# Version Detection
		m << { :version=>@headers["server"].scan(/^VisualRoute \((tm|R)\) ([^\s]+)$/)[0][1] } if @headers["server"] =~ /^VisualRoute \((tm|R)\) ([^\s]+)$/

		if @headers["server"] =~ /^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/
			# Edition Detection
			m << { :string=>@headers["server"].scan(/^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/)[0][1] }

			# Version Detection
			m << { :version=>@headers["server"].scan(/^VisualRoute \((tm|R)\) ([\d]{4} .+ Edition) \(v([^\)]+)\)$/)[0][2] }

		end

	end

	# Return passive matches
	m
end

end

