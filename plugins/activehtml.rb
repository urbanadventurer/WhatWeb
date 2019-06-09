##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ActiveHTML"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-08-06
  "Andrew Horton", # v0.2 # 2016-04-18 # Replaced passive function with match. 
]
version "0.2"
description "seliSoft ActiveHTML provides Active-Server-Pages (ASP) to nearly every web server supporting CGI."
website "http://www.selisoft.com/en/ahtml/"

# ShodanHQ results as at 2011-08-06 #
# 65 for ActiveHTML

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/ActiveHTML\/([^\s]+)/, :search=>"headers[server]" },

	# Version Detection # X-Powered-By
	{ :version=>/seliSoft ActiveHTML\/([^\s]+)/, :search=>"headers[x-powered-by]" } 
]

end

