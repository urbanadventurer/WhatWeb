##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "DeleGate"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-30
  # v0.2 # 2011-06-04 # Updated regex. 
  "Andrew Horton", # v0.3 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.3"
description "DeleGate is a multi-purpose application level gateway, or a proxy server which runs on multiple platforms (Unix, Windows, MacOS X and OS/2). DeleGate mediates communication of various protocols (HTTP, FTP, NNTP, SMTP, POP, IMAP, LDAP, Telnet, SOCKS, DNS, etc.), applying cache and conversion for mediated data, controlling access from clients and routing toward servers."
website "http://www.delegate.org/delegate/"

# ShodanHQ results as at 2011-06-04 #
# 393 for DeleGate-Ver

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/^DeleGate\/([^\s]+)/, :search=>"headers[server]" },
	# Version Detection # HTTP DeleGate-Ver Header
	{ :version=>/^([^\s]+) \(delay=/, :search=>"headers[delegate-ver]" },
]

end

