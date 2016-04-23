##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NetPort" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "NetPort server - used by several routers."

# ShodanHQ results as at 2011-05-30 #
# 83,817 for NetPort

matches [
	
	# HTTP Server Header
	{ :regexp=>/^NetPort Software/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^NetPort Software ([^\s]+)$/, :search=>"headers[server]" },

	# Netport HTTP Header # Netport: Power by NetPort
	{ :name=>"Netport HTTP Header", :regexp=>/^Power by NetPort$/, :search=>"headers[netport]" },

]

end

