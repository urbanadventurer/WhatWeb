##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "i.LON-SmartServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Echelon's i.LON SmartServer 2.0 is a versatile smart energy manager that helps your business achieve its operating and energy-efficiency goals. Designed to connect to IP-based applications such as enterprise energy management solutions, demand response programs, streetlight management systems, and high-value remote asset management programs, the server lets you link thousands of electronic devices to control centers. - Homepage: http://www.echelon.com/products/cis/smartserver/default.htm"

# ShodanHQ results as at 2011-03-15 #
# 1,567 for i.LON realm wind

# Examples #
examples %w|
173.248.228.34
202.71.202.198
72.254.77.134
209.68.147.135
12.50.72.190
65.71.234.24
70.168.77.199
|

# Passive #
def passive
	m=[]

	# Server(WindRiver or WindWeb) and WWW-Authenticate(Basic realm="i.LON")
	if (@meta["server"] =~ /^WindRiver/ or @meta["server"] =~ /WindWeb/) and @meta["www-authenticate"] =~ /^Basic realm="i\.LON"$/

		m << { :name=>"HTTP Server and WWW-Authenticate headers" }

	end

	# Return passive matches
	m

end

end

