##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Zero-One-Technology-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "Zero One Technology Print Server - Print servers connect printers directly to the network so that multiple PCs can share them."
website "http://www.01tech.com/p1-1product.asp?Bid=2"

# ShodanHQ results as at 2011-03-14 #
# 2,579 for ZOT-PS

matches [
	# HTTP Server Header
	{ :regexp=>/^ZOT-PS-/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^ZOT-PS-[\d]+\/(.+)$/, :search=>"headers[server]" },

]

end

