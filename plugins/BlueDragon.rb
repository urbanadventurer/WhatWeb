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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/BlueDragon Server( JXAS| JX)?(\/| )([\d\.]+)/)[0][2] } if @headers["server"] =~ /BlueDragon Server( JXAS| JX)?(\/| )([\d\.]+)/

	m << { :string=>@headers["server"].scan(/BlueDragon Server (JXAS|JX)/) } if @headers["server"] =~ /BlueDragon Server (JXAS|JX)/

	# Version Detection # X-Powered-By Header
	m << { :version=>@headers["x-powered-by"].scan(/BlueDragon Server\/([^\s^,]+)/) } if @headers["x-powered-by"] =~ /BlueDragon Server\/([^\s^,]+)/

	# Return passive matches
	m
end
end

