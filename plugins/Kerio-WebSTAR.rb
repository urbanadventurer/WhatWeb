##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Kerio-WebSTAR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "Kerio WebSTAR (formerly 4D WebSTAR and StarNine WebSTAR) is an HTTP web server for Mac OS X with older versions running on classic Mac OS. On June 30, 2008, WebSTAR was officially discontinued. Technical support for the product ended on June 30, 2009. - More info: en.wikipedia.org/wiki/Kerio_WebSTAR"

# ShodanHQ results as at 2011-05-31 #
# 5,486 for WebSTAR
# 3,267 for WebSTAR -4d

matches [

	{ :regexp=>/^(Kerio_|WebSTAR|4D_WebStar)/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^WebSTAR\/([^\s^\(]+)/, :search=>"headers[server]" },
	{ :version=>/^Kerio_WebSTAR\/([^\s^\(]+)/, :search=>"headers[server]" },
	{ :version=>/^WebSTAR ([\d\.]+ .+)$/, :search=>"headers[server]" },
	{ :version=>/^4D_WebStar_[A-Z]\/([\d\.]+)/, :search=>"headers[server]" },

]

end

