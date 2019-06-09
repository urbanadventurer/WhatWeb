##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "lighttpd"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  # v0.2 # 2011-01-25 # Updated version detection. 
  # v0.3 # 2011-03-06 # Updated OS detection. 
  "Andrew Horton", # v0.4 # 2016-04-21 # Moved patterns from passive function to matches[]. 
	"Andrew Horton", # v0.5 # 2019-07-10 # Fix warning: character class has duplicated range
]
version "0.5"
description "Lightweight open-source web server."
website "http://www.lighttpd.net/"

# ShodanHQ results as at 2010-10-26 #
# 124,972 for "server: lighttpd"

matches [
	# Server HTTP header
	{ :regexp=>/lighttpd/, :search=>"headers[server]" },

	# Version Detection # Server HTTP header
	{ :version=>/^[\s]*lighttpd\/([^\s]+)/, :search=>"headers[server]" },

	# OS Detection # Server HTTP header
	{ :os=>/^[\s]*lighttpd \(([^\)]+)\)/, :search=>"headers[server]" },	
]

end

