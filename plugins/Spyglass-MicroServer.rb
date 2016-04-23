##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Spyglass-MicroServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Spyglass MicroServer is a small footprint, scalable, embedded Web server that is standards-based, customizable and features dynamic content generation with multi-platform support."

# ShodanHQ results as at 2011-03-13 #
# 441 for Spyglass MicroServer

matches [

	# HTTP Server Header
	{ :regexp=>/^Spyglass_MicroServer/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Spyglass_MicroServer\/(.+)$/, :search=>"headers[server]" },

]

end

