##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SystemBase-PortBase" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-23
version "0.1"
description "Portbase is a Serial to Ethernet Device Server with an internal modem for PPP server and client. When a network failure has occurs, serial device can still be managed over PSTN connection. Also, RAS server feature enables both directly and network-connected devices to be accessed via Portbase. Uses telnet for remote management"
website "http://www.sysbas.com/e-Products/?sNum=261"
# Data Sheet: http://www.sysbas.com/include/FileDown.asp?OriginalFileName=down-2008427143713.pdf&FileName=Portbase_White_Paper_Eng.pdf&Folder=J_Download

# ShodanHQ results as at 2011-03-23 #
# 7 for PortBase
# All results are from Korea



# Passive #
def passive
	m=[]

	# Server: WindWeb # WWW-Authenticate: Basic realm="PortBase"
	if @status == 401 and @headers["server"] =~ /^WindWeb/ and @headers["www-authenticate"] =~ /^Basic realm="PortBase"$/
		m << { :name=>"HTTP Server and WWW-Authenticate Headers" }
	end

	# Return passive matches
	m
end

end

