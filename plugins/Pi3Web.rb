##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Pi3Web" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.2"
description "Pi3Web is a free, multithreaded, highly configurable and extensible HTTP server and development environment for cross platform internet server development and deployment."
website "http://pi3web.sourceforge.net/pi3web/"

# ShodanHQ results as at 2011-06-02 #
# 74 for Pi3Web

matches [
	# HTTP Server Header
	{ :regexp=>/^Pi3Web/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Pi3Web\/([^\s]+)$/, :search=>"headers[server]" },

]

end

