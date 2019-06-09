##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Geobytes-GeoSelect"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-17
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. Updated description. 
]
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

