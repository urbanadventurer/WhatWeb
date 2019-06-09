##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Synchronet-BBS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-04
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Synchronet Multinode BBS Software - Open source BBS that works on the DOS, Windows, or OS/2 operating system and supports multiple simultaneous users with hierarchical message and file areas, multi-user chat, and the ever-popular BBS door games."
website "http://www.synchro.net/"

# ShodanHQ results as at 2011-06-04 #
# 93 for Synchronet BBS
# 69 for Synchronet BBS Win32
# 23 for Synchronet BBS Linux
#  1 for Synchronet BBS FreeBSD

matches [
	
	# HTTP Server Header
	{ :regexp=>/^Synchronet BBS/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Synchronet BBS for .+ Version ([^\s]+)$/, :search=>"headers[server]" },

]

end

