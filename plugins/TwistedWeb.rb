##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TwistedWeb" do
author "Andrew Horton" # 2015-05-06
version "0.1"
description "Twisted web is the HTTP server provided by Twisted, an event-driven networking engine written in Python and licensed under the open source MIT license. Developed by Twisted Matrix Labs. Homepage - https://twistedmatrix.com/"

# Matches #
matches [
# Version in HTTP header
{ :version=>/TwistedWeb\/?([^ ]+)?/, :search=>"headers[server]"},
]
end
