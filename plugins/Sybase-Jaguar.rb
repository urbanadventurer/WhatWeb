##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Sybase-Jaguar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.2"
description "Sybase Jaguar server - discontinued"
website "http://www.sybase.com/products/archivedproducts/jaguarcts"

# ShodanHQ results as at 2011-07-27 #
# 468 for Server: Jaguar Server Version

matches [
	
	# HTTP Server Header
	{ :regexp=>/^Jaguar Server Version/, :search=>"headers[server]" },
	
	# Version Detection # HTTP Server Header
	{ :version=>/^Jaguar Server Version ([\d\.]+)$/, :search=>"headers[server]" },

]

end

