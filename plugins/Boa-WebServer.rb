##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-19 # Andrew Horton
# Replaced passive function with match
##
# Version 0.3 # 2011-01-08 #
# Updated HTTP Server Header match
##
Plugin.define "Boa-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Boa Webserver - Do You Feel the Need for Speed? Boa currently seems to be the favorite web server in the embedded crowd, and embedded Linux, despite all the marketing hype, really is a big deal. Supposedly, an older version of Boa, v0.92q, runs in 32K address space on m68k, like used in uCLinux."
website "http://www.boa.org/"

# About 176872 ShodanHQ results for "server: boa" @ 2010-10-26

matches [
	
	{ :version=>/^[\s]*Boa\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

]


end

