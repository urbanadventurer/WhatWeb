##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "BitKeeper"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-04
  "Andrew Horton", # v0.2 # 2016-04-19 # Replaced passive function with match. 
]
version "0.2"
description "BitKeeper Bug Manager - BitKeeper is paving the way for the next generation of SCM tools. As the leader in distributed configuration management and the culmination of a decade of innovation, BitKeeper has been shown to double the pace of software development."
website "http://bitkeeper.com/"

# Google results as at 2011-06-04 #
# 1 for intitle:"BugManager Home"
# 1 for inurl:"/cgi-bin/query.cgi?.page=advquery"

# ShodanHQ results as at 2011-06-04 #
# 1 for bkhttp



# Matches #
matches [

	# Advanced Query link
	{ :text=>'<A class="tab" HREF="/cgi-bin/query.cgi?.page=advquery">Advanced Query</A>' },

	# Version Detection # HTTP Server Header
	{ :version=>/^bkhttp\/([^\s]+)$/, :search=>"headers[server]" },
	
]

end

