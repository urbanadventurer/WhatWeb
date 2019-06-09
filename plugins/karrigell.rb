##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Karrigell"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-30
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Karrigell is a flexible Python web framework, with a clear and intuitive syntax. It is independent from any database, ORM or templating engine, and lets the programmer choose between a variety of coding styles."
website "http://karrigell.sourceforge.net/en/index.html"

# ShodanHQ results as at 2011-05-30 #
# 69 for Karrigell
#  6 for Karrigell -Python

matches [

	{ :regexp=>/^Karrigell/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Karrigell\/([^\s]+) /, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Karrigell ([^\s]+)$/, :search=>"headers[server]" },
	
]

end

