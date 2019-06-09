##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TeleFinder"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-02
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "TeleFinder is a Macintosh-based bulletin-board system written by Spider Island Software, based on a client.server model whose client end provides a Mac-like GUI. - More Info: http://en.wikipedia.org/wiki/TeleFinder"

# ShodanHQ results as at 2011-06-02 #
# 8 for telefinder

matches [

	# HTTP Server Header
	{ :regexp=>/^TeleFinder/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^TeleFinder\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

