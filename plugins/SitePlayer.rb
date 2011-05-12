##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SitePlayer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "SitePlayer is an embedded ethernet HTTP server designed to easily and inexpensively web enable any microprocessor-based device. SitePlayer Telnet is an RS232 to Ethernet protocol converter. It allows you to connect legacy RS232 devices to The Internet by providing a TCP/IP telnet session to an RS232 port. There are many devices which can only be controlled via RS232. With SitePlayer you can now control these devices through The Internet. - Homepage: http://netmedia.com/siteplayer/"
# Data sheets: http://netmedia.com/siteplayer/webserver/documents.html

# ShodanHQ results as at 2011-05-12 #
# 24 for SitePlayer

# Examples #
examples %w|
131.156.49.67
74.246.95.132
74.246.8.93
67.100.173.142
74.246.81.76
74.246.8.82
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :model=>"Telnet", :version=>@meta["server"].scan(/^SitePlayer Telnet\/([^\s]+)$/) } if @meta["server"] =~ /^SitePlayer Telnet\/([^\s]+)$/

	# WWW-Authenticate realm
	m << { :model=>"Telnet", :name=>"WWW-Authenticate realm" } if @meta["www-authenticate"] =~ /^Basic realm="SitePlayer Telnet Configuration"$/

	# Return passive matches
	m
end

end

