##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-06-04 #
# Updated regex
##
Plugin.define "DeleGate" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.2"
description "DeleGate is a multi-purpose application level gateway, or a proxy server which runs on multiple platforms (Unix, Windows, MacOS X and OS/2). DeleGate mediates communication of various protocols (HTTP, FTP, NNTP, SMTP, POP, IMAP, LDAP, Telnet, SOCKS, DNS, etc.), applying cache and conversion for mediated data, controlling access from clients and routing toward servers. - homepage: http://www.delegate.org/delegate/"

# ShodanHQ results as at 2011-06-04 #
# 393 for DeleGate-Ver



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^DeleGate\/([^\s]+)/) } if @headers["server"] =~ /^DeleGate\/([^\s]+)/

	# Version Detection # HTTP DeleGate-Ver Header
	m << { :version=>@headers["delegate-ver"].scan(/^([^\s]+) \(delay=/) } if @headers["delegate-ver"] =~ /^([^\s]+) \(delay=/

	# Return passive matches
	m
end

end

