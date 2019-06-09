##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Velazquez"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-31
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
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

