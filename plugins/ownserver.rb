##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "OwnServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-16
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "OwnServer is a web server used as a webserver for watching security cameras remotly. It allows broadcasting live streaming video on the web through the built-in webserver."
website "http://www.anteco.co.il/"

# ShodanHQ results as at 2011-05-16 #
# 26,527 for OwnServer

matches [
	# HTTP Server Header
	{ :regexp=>/^OwnServer/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^OwnServer([\d\.]+)$/, :search=>"headers[server]" },

]

end

