##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Embedthis-AppWeb"
authors [
  "Andrew Horton",
  # Andrew Horton, # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Web server for embedded devices"
website "http://embedthis.com/products/appweb/embedded-web-server.html"

matches [
	{ :version=>/Mbedthis-Appweb\/(.*)/, :search=>"headers[server]" },
	{ :regexp=>/^Mbedthis-Appweb/, :search=>"headers[server]" },
]

end

