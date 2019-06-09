##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "NetTalk-WebServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-23
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Webserver using NetTalk. NetTalk is the de-facto standard tool for TCP/IP networking in Clarion."
website "http://www.capesoft.com/docs/NetTalk/nettalk.htm"
# More info: http://www.capesoft.com/docs/nettalk/nettalkwebbasic.htm

# ShodanHQ results as at 2011-05-23 #
# 146 for NetTalk-WebServer

matches [
	# HTTP Server Header
	{ :regexp=>/^NetTalk-WebServer/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^NetTalk-WebServer\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

