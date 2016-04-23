##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
# Updated description
##
Plugin.define "Geobytes-GeoSelect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.2"
description "GeoSelect is a Microsoft IIS module. GeoSelect gives you easy access to numerous features that you can use to impress your clients.  From geographically customized menus through to log file analysis, your clients will be impressed when they see their web site dynamically transformed to the viewer's location."
website "http://www.geobytes.com/GeoSelect.htm"

# ShodanHQ results as at 2011-05-17 #
# 76 for geobytes

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/Geobytes-GeoSelect\/([\d\.]+)/, :search=>"headers[server]" },
	{ :regexp=>/Geobytes-GeoSelect/, :search=>"headers[server]" },
]


end

