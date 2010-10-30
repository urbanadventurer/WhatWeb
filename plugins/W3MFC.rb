##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "W3MFC" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "W3Mfc is a collection of MFC classes to implement a Web Server - homepage: http://www.naughter.com/w3mfc.html"

# About 5486 ShodanHQ results for "Server: W3MFC" @ 2010-11-01
examples %w|
74.169.18.250
97.121.156.164
74.84.66.150
60.249.212.232
201.232.25.79
201.0.150.4
209.13.178.3
76.217.77.98
98.112.70.16
189.7.151.187
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/W3MFC\/([\d\.]+)/) } if @meta["server"] =~ /W3MFC\/([\d\.]+)/

	m

end

end

