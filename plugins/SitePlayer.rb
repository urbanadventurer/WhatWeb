##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "SitePlayer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.2"
description "SitePlayer is an embedded ethernet HTTP server designed to easily and inexpensively web enable any microprocessor-based device. SitePlayer Telnet is an RS232 to Ethernet protocol converter. It allows you to connect legacy RS232 devices to The Internet by providing a TCP/IP telnet session to an RS232 port. There are many devices which can only be controlled via RS232. With SitePlayer you can now control these devices through The Internet."
website "http://netmedia.com/siteplayer/"
# Data sheets: http://netmedia.com/siteplayer/webserver/documents.html

# ShodanHQ results as at 2011-05-12 #
# 24 for SitePlayer

matches [
	
	# Version Detection # HTTP Server Header
	{ :model=>"Telnet", :version=>/^SitePlayer Telnet\/([^\s]+)$/, :search=>"headers[server]" },

	# WWW-Authenticate realm
	{ :model=>"Telnet", :name=>"WWW-Authenticate realm", :regexp=>/^Basic realm="SitePlayer Telnet Configuration"$/, :search=>"headers[www-authenticate]" },

]

end

