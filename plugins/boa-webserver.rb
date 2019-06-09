##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Boa-WebServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  # v0.2 # 2011-01-08 # Updated HTTP Server Header match. 
  "Andrew Horton", # v0.3 # 2016-04-19 # Replaced passive function with match. 
  # Andrew Horton # v0.4 # 2019-07-10 #  warning: character class has duplicated range: /^[\s]*Boa\/([^\s^\r^\n]+)/ 
]
version "0.4"
description "Boa Webserver - Do You Feel the Need for Speed? Boa currently seems to be the favorite web server in the embedded crowd, and embedded Linux, despite all the marketing hype, really is a big deal. Supposedly, an older version of Boa, v0.92q, runs in 32K address space on m68k, like used in uCLinux."
website "http://www.boa.org/"

# About 176872 ShodanHQ results for "server: boa" @ 2010-10-26

matches [
	
	{ :version=>/^[\s]*Boa\/([^\s]+)/, :search=>"headers[server]" },

]


end

