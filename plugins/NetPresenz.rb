##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NetPresenz" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.2"
description "NetPresenz is a Classic Macintosh implementation of the WWW, Gopher and FTP server protocols. It is compatible with most web browsers and FTP clients. It allows your Mac to act as an FTP server so you (and others) can access your files from anywhere around the world. You can also host a web site directly from your computer."
website "http://www.stairways.com/main/netpresenz"

# ShodanHQ results as at 2011-06-04 #
# 26 for netpresenz

matches [
	# HTTP Server Header
	{ :regexp=>/^NetPresenz/, :name=>"HTTP Server Header", :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^NetPresenz\/([^\s]+)$/, :search=>"headers[server]" },

]

end

