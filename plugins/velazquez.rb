##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Velazquez" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-31
version "0.2"
description "Velazquez HTTP Server"

# ShodanHQ results as at 2011-03-13 #
# 293 for Velazquez

matches [

	# HTTP Server Header
	{ :regexp=>/^Velazquez/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Velazquez ([\d\.]+)$/, :search=>"headers[server]" },

]

end

