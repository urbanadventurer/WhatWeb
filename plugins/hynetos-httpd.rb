##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "HyNetOS-httpd"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-11
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "HyNetOS is a network operating system specifically designed for embedded systems, where computing and memory resources are limited."
website "http://www.msc-ge.com/en/produkte/elekom/mc/hyperstone/sw_hynetos.html"

# ShodanHQ results as at 2011-04-11 #
# 6,124 for HyNetOS

matches [
	# Version Detection # HTTP Server Header
	{ :os=>"HyNetOS", :version=>/^HyNetOS\/([^\s]+)$/, :search=>"headers[server]" },

	{ :os=>"HyNetOS", :regexp=>/^HyNetOS/, :search=>"headers[server]" },
	
]

end

