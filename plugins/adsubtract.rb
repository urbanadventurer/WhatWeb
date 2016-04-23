##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-18 # Andrew Horton
# Replaced passive function with match for server header
##
Plugin.define "AdSubtract" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-06
version "0.2"
description "AdSubtract - a Windows proxy which removes popup ads."
website "http://AdSubtract.com"

# ShodanHQ results as at 2011-06-06 #
# 65 for AdSubtract

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/^AdSubtract ([\d\.]+)$/, :search=>"headers[server]" }
]

end

