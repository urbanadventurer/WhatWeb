##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Spyglass-MicroServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-13
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Spyglass MicroServer is a small footprint, scalable, embedded Web server that is standards-based, customizable and features dynamic content generation with multi-platform support."

# ShodanHQ results as at 2011-03-13 #
# 441 for Spyglass MicroServer

matches [

	# HTTP Server Header
	{ :regexp=>/^Spyglass_MicroServer/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Spyglass_MicroServer\/(.+)$/, :search=>"headers[server]" },

]

end

