##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.3 # 2011-03-06 #
# Updated OS detection
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "lighttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.4"
description "Lightweight open-source web server."
website "http://www.lighttpd.net/"

# ShodanHQ results as at 2010-10-26 #
# 124,972 for "server: lighttpd"

matches [
	# Server HTTP header
	{ :regexp=>/lighttpd/, :search=>"headers[server]" },

	# Version Detection # Server HTTP header
	{ :version=>/^[\s]*lighttpd\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

	# OS Detection # Server HTTP header
	{ :os=>/^[\s]*lighttpd \(([^\)]+)\)/, :search=>"headers[server]" },	
]

end

