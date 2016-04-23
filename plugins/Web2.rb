##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Web2" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.2"
description "A nice web server, easy to setup! lots of features including cgi, ssi, aliasing, virtual domains and more! - Homepage : Way Back Machine [2005-04-01] - http://web.archive.org/web/20050401233601/http://dink.org/"
# Homepage [Offline] : http://dink.org/web2/

# ShodanHQ results as at 2011-03-11 #
# 66 for Web/2 v1
# 48 for Web/2 v1.3x

matches [

	# HTTP Server Header
	{ :os=>"Mac OS/2", :regexp=>/^Web\/2 /, :search=>"headers[server]" },
	
	# Version Detection # HTTP Server Header
	{ :os=>"Mac OS/2", :version=>/^Web\/2 v([^\r^\n]+)$/, :search=>"headers[server]" },

]

end


