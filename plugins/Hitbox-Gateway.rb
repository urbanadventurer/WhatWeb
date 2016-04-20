##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Hitbox-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.2"
description "Adobe Omniture Hitbox Gateway collects HTTP headers for web site usage statistics"
website "http://login.hitbox.com/"

# ShodanHQ results as at 2011-06-03 #
# 463 for Server Hitbox Gateway
# All results are from the United States

matches [
	{ :regexp=>/^Hitbox Gateway/, :search=>"headers[server]" },

	# Version Detection # Server: Hitbox Gateway
	{ :version=>/^Hitbox Gateway ([^\s^\r^\n]{1,10})$/, :search=>"headers[server]" },
	
	# /favicon.ico
	{ :url=>"/favicon.ico", :md5=>"0c7fdff990b60f5c7ec6ecf995c6f59f" },	
]


end

