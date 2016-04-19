##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "Embedthis-AppWeb" do
author "Andrew Horton"
version "0.2"
description "Web server for embedded devices"
website "http://embedthis.com/products/appweb/embedded-web-server.html"

matches [
	{ :version=>/Mbedthis-Appweb\/(.*)/, :search=>"headers[server]" },
	{ :regexp=>/^Mbedthis-Appweb/, :search=>"headers[server]" },
]

end

