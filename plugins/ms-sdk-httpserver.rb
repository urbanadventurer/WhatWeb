##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "MS-SDK-HttpServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-15
  "Andrew Horton", # v0.2 # 2016-04-21 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The Microsoft .NET Micro Framework Platform SDK is a powerful and flexible platform for rapidly creating embedded device firmware with Microsoft Visual Studio. This plugin identifies servers based on the HttpServer sample provided with the SDK."
website "http://msdn.microsoft.com/en-us/library/ee434092.aspx"
# More Info: http://msdn.microsoft.com/en-us/library/ee436350.aspx

# ShodanHQ results as at 2011-05-15 #
# 39,532 for MS-SDK-HttpServer

matches [
	# HTTP Server Header
	{ :regexp=>/^MS-SDK-HttpServer/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^MS-SDK-HttpServer\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

