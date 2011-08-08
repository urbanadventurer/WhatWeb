##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Trend-Micro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-12
version "0.1"
description "Trend Micro server - http://www.trendmicro.com/"

# ShodanHQ results as at 2011-06-12 #
# 19 for Trend Micro

# Examples #
examples %w|
150.70.74.71
218.104.127.179
150.70.65.213
216.104.8.86
216.104.8.81
150.70.65.241
150.70.74.72
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Trend Micro/

		m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^Trend Micro$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^Trend Micro ([^\s]+)$/) } if @headers["server"] =~ /^Trend Micro ([^\s]+)$/

	end

	# Return passive matches
	m
end

end

