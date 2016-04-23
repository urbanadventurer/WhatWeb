##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Viking" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.2"
description "Viking is an all-in-one server that provides everything from HTTP and FTP to Gopher, IRC, and NTP; with firewalling, proxying and more"
website "http://www.robtex.com/viking.html"

# ShodanHQ results as at 2011-03-07 #
# 22 for Viking -realm -apache -IIS

matches [

	# HTTP Server Header
	{ :regexp=>/^Viking/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Viking\/([^\s]{1,15})/, :search=>"headers[server]" },

]

end


