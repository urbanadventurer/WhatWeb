##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Nintendo-Wii" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-02
version "0.1"
description "Nintendo Wii video game console"
website "http://www.nintendo.com/"

# More Info # Wi-Fi Network Adapter (for Wii or DS) #
# http://wifi.nintendo.co.jp/wap/index.html
# http://en.wikipedia.org/wiki/Nintendo_Wi-Fi_USB_Connector
# http://store.nintendo.com/webapp/wcs/stores/servlet/ProductDisplay?lastAction=setCurr&jspStoreDir=NOASTORE&languageId=-1&catalogId=10001&categoryId=11157&productId=95704&currency=USD&storeId=10001&ddkey=SetCurrencyPreference

# ShodanHQ results as at 2011-08-02 #
# 33 for "Nintendo Wi-Fi Network Adapter"
#  4 for Nintendo Wii



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Nintendo Wii( \(http\))?$/
		m << { :name=>"HTTP Server Header" }
	elsif @headers["server"] =~ /^Nintendo Wii ([^\(]+)$/
		m << { :string=>"#{$1}" }
	end

	# WWW-Authenticate Header
	m << { :certainty=>75, :name=>"www-authenticate" } if @headers["www-authenticate"] =~ /Basic realm="Nintendo Wi-Fi Network Adapter"/

	# Return passive matches
	m
end
end

