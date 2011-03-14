##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netscape-Enterprise" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Netscape Enterprise Server was a web server developed originally by Netscape Communications Corporation. The product has since been renamed Sun Java System Web Server, reflecting the product's acquisition by Sun Microsystems. - Homepage: http://wikis.sun.com/display/WebServer/Sun+Java+System+Web+Server"

# ShodanHQ results as at 2011-03-14 #
# 11,641 for Netscape-Enterprise

# Examples #
examples %w|
80.250.173.147
202.27.156.18
155.44.241.42
200.185.28.12
47.234.44.96
208.84.224.177
192.104.67.58
141.123.222.4
200.185.64.3
203.241.162.36
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Netscape-Enterprise\/(.+)$/) } if @meta["server"] =~ /^Netscape-Enterprise\/(.+)$/

	# Return passive matches
	m

end

end

