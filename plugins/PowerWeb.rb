##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "PowerWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.2"
description "PowerWeb is a full 128-bit secure server with unlimited RSA encryption using industry standard SSL 3.0 (and 2.0), providing HTTP, FTP, SMTP and POP3 services, with many extensions for rapid database application development and dynamic page content."
website "http://www.compusource.co.za/powerweb/"

# ShodanHQ results as at 2011-06-04 #
# 1 for PowerWeb/4

matches [
	
	# HTTP Server Header
	{ :regexp=>/^PowerWeb/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^PowerWeb\/([^\s]+)$/, :search=>"headers[server]" },

]

end

