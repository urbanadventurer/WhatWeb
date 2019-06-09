##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TivoWebPlus"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-21
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "TivoWebPlus is a web server that runs on your TiVo PVR. It is written in TCL, and has the ability to browse the channel guide, perform searches, and schedule and delete recordings."
website "http://sourceforge.net/projects/tivowebplus/"

# ShodanHQ results as at 2011-05-21 #
# 31 for TivoWebPlus

matches [

	# WWW-Authenticate Realm
	{ :regexp=>/TivoWebPlus/, :search=>"headers[www-authenticate]" },

	# Version Detection # WWW-Authenticate Realm
	{ :version=>/^Basic realm=['"]TivoWebPlus - v([^'^"]+)['"]$/, :search=>"headers[www-authenticate]" },

]

end

