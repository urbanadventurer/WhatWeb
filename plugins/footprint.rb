##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Footprint"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-31
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Caching server"

# ShodanHQ results as at 2011-03-31 #
# 11,711 for Footprint FPMCP


matches [
	# Version Detection # HTTP Server Header
	{ :version=>/^Footprint ([\d\.]+)\/FPMCP$/, :search=>"headers[server]" },
	{ :regexp=>/^Footprint/, :search=>"headers[server]" },
]

end

