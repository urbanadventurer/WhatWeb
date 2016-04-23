##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "WebKnight" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "AQTRONIX WebKnight is an application firewall for IIS and other web servers and is released under the GNU General Public License. More particularly it is an ISAPI filter that secures your web server by blocking certain requests. If an alert is triggered WebKnight will take over and protect the web server. It does this by scanning all requests and processing them based on filter rules, set by the administrator."
website "http://www.aqtronix.com/?PageID=99"

# ShodanHQ results as at 2011-03-14 #
# 276 for WebKnight

matches [

	# HTTP Server Header
	{ :regexp=>/^WebKnight/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^WebKnight\/(.+)$/, :search=>"headers[server]" },

]

end

