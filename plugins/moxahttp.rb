##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "MoxaHttp" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "Device Networking for Industry: device server, industrial ethernet switch."
website "http://www.moxa.com/product/product.aspx"

# ShodanHQ results as at 2011-05-30 #
# 3,104 for MoxaHttp

matches [
	# HTTP Server Header
	{ :regexp=>/^MoxaHttp/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^MoxaHttp\/([^\s]+)$/, :search=>"headers[server]" },

]

end

