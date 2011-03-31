##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Footprint" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-31
version "0.1"
description "Caching server"

# ShodanHQ results as at 2011-03-31 #
# 11,711 for Footprint FPMCP

# Examples #
examples %w|
4.27.22.138
207.123.56.93
198.78.205.8
4.26.226.13
205.128.77.47
4.26.235.17
8.12.199.41
192.221.125.14
8.27.145.18
198.78.222.33
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Footprint ([\d\.]+)\/FPMCP$/) } if @meta["server"] =~ /^Footprint ([\d\.]+)\/FPMCP$/

	# Return passive matches
	m

end

end

