##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Proxy-Authenticate" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-09
version "0.2"
description "This plugin extracts the realm from the proxy-authenticate HTTP header."

# About 1402 ShodanHQ results for proxy-authenticate @ 2011-01-09

matches [
	
	# Proxy-Authenticate HTTP Header
	{ :string=>/realm="([^"]+)"/, :search=>"headers[proxy-authenticate]" },

]

end

