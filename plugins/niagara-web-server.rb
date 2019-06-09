##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Niagara-Web-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-11-01
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Niagara Web Server"

# 8073 ShodanHQ results for "Niagara web server"

matches [
	# HTTP Server Version
	{ :regexp=>/Niagara Web Server/, :search=>"headers[server]" },

	# HTTP Server Version
	{ :version=>/Niagara Web Server\/([\d\.]+)/, :search=>"headers[server]" },

	# HTTP Niagara-Release Header
	{ :version=>/^(.*)$/, :search=>"headers[niagara-release]" },

	# HTTP Niagara-ffs Header
	{ :name=>"Niagara-ffs HTTP Header", :regexp=>//, :search=>"headers[niagara-ffs]" },	
]

end

