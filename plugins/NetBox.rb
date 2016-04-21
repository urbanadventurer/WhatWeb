##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NetBox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "NetBox HTTP server [Chinese]"
website "http://www.netbox.cn/"

# ShodanHQ results as at 2011-03-14 #
# 1,778 for NetBox -realm

matches [
	# HTTP Server Header
	{ :regexp=>/^NetBox/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^NetBox Version (.+)$/, :search=>"headers[server]" },

]

end

