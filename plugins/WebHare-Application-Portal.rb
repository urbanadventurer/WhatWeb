##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "WebHare-Application-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "WebHare Application Portal - Enterprise Content Management - The flexible design of WebHare AP allows for complex web applications completely tailored to build support for an intranet or website as well as a separate product line."
website "http://www.b-lex.nl/"

# ShodanHQ results as at 2011-03-14 #
# 47 for WebHare Application Portal
# All results are from the Netherlands

matches [
	
	# HTTP Server Header
	{ :regexp=>/^WebHare Application Portal/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^WebHare Application Portal v([\d\.]+) Webserver$/, :search=>"headers[server]" },

]

end

