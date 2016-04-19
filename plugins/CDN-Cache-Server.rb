##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "CDN-Cache-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.2"
description "CDN-Cache-Server"

# ShodanHQ results as at 2011-03-06 #
# 5,686 for Server: "Cdn Cache Server"

matches [
	# Server: Cdn Cache Server
	{:version=>/^Cdn Cache Server V([\d\.]+)/, :search=>"headers[server]"},
]

end


