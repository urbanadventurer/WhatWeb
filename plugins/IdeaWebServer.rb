##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "IdeaWebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "home.net.pl hosting - a major polish hosting company home.pl uses its own server software (Idea Web Server)"
website "http://home.net.pl"

# ShodanHQ results as at 2011-03-13 #
# 91,705 for IdeaWebServer
# All results are from Poland

matches [
	
	# Version Detection # HTTP Server Header
	{ :version=>/^IdeaWebServer\/v([\d\.]+)$/, :search=>"headers[server]" },
	
]

end

