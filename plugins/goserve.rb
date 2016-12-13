##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "GoServe" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "GoServe - A Web and Gopher Server for OS/2. SRE-http is a highly configurable http server which requires GoServe"
website "http://www2.hursley.ibm.com/goserve"

# More Info #
# SRE-http is a highly configurable http/1.1 web server for OS/2. To use the SRE-http web server, you will need GoServe (a free, IBM EWS, OS/2 Internet server). - Homepage: http://www.srehttp.org/server/
# ShodanHQ results as at 2011-05-31 #
# 32 for GoServe
# 14 for GoServe -OS

matches [
	# HTTP Server Header
	{ :regexp=>/^GoServe/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^GoServe\/([^\s]+)$/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^GoServe for OS\/2, version ([^\s^;]+); SRE-http [\d\.]+$/, :search=>"headers[server]" },

	# Module Detection
	{ :module=>/^GoServe for OS\/2, version [^\s^;]+; (SRE-http [\d\.]+)$/, :search=>"headers[server]" },
]


end

