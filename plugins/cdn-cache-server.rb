##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CDN-Cache-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-06
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "CDN-Cache-Server"

# ShodanHQ results as at 2011-03-06 #
# 5,686 for Server: "Cdn Cache Server"

matches [
	# Server: Cdn Cache Server
	{:version=>/^Cdn Cache Server V([\d\.]+)/, :search=>"headers[server]"},
]

end


