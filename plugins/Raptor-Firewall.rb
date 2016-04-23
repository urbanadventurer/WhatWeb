##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Raptor-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Raptor Firewall (previously known as Raptor EagleNT) was acquired by Symantec and has been discontinued"
website "http://www.symantec.com/en/nz/business/support/overview.jsp?pid=52789"

# ShodanHQ results as at 2011-03-13 #
# 55,684 for Simple, Secure Web Server

matches [
	# HTTP Server Header
	{ :regexp=>/^Simple, Secure Web Server/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Simple, Secure Web Server (.+)$/, :search=>"headers[server]" },

]

end

