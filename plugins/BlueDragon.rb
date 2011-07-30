##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlueDragon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-30
version "0.1"
description "BlueDragon for the Microsoft .NET Framework allows you to natively integrate and deploy your ColdFusion applications on the .NET platform. - Homepage: http://www.newatlanta.com/products/bluedragon/product_info/overview.cfm"

# ShodanHQ results as at 2011-07-30 #
# 319 for BlueDragon

# Examples #
examples %w|
64.253.129.226
64.253.129.227
67.225.238.10
67.79.174.81
70.90.116.98
84.255.212.85
204.57.104.32
207.138.236.81
208.52.138.7
208.52.138.13
209.161.21.85
209.161.21.58
209.161.21.104
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/BlueDragon Server( JXAS| JX)?(\/| )([\d\.]+)/)[0][2] } if @meta["server"] =~ /BlueDragon Server( JXAS| JX)?(\/| )([\d\.]+)/

	m << { :string=>@meta["server"].scan(/BlueDragon Server (JXAS|JX)/) } if @meta["server"] =~ /BlueDragon Server (JXAS|JX)/

	# Version Detection # X-Powered-By Header
	m << { :version=>@meta["x-powered-by"].scan(/BlueDragon Server\/([^\s^,]+)/) } if @meta["x-powered-by"] =~ /BlueDragon Server\/([^\s^,]+)/

	# Return passive matches
	m
end
end

