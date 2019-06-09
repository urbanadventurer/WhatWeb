##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RealVNC"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-13
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "RealVNC provides remote control software which lets you see and interact with desktop applications across any network."
website "http://www.realvnc.com/"

# ShodanHQ results as at 2011-03-13 #
# 872 for RealVNC

matches [
	# HTTP Server Header
	{ :regexp=>/^RealVNC/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^RealVNC\/(.+)$/, :search=>"headers[server]" },

]

end

