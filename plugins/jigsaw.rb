##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Jigsaw" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.2"
description "Jigsaw is W3C's leading-edge Web server platform, providing a sample HTTP 1.1 implementation and a variety of other features on top of an advanced architecture implemented in Java."
website "http://www.w3.org/Jigsaw/"

# ShodanHQ results as at 2011-06-07 #
# 79 for Jigsaw

matches [

	{ :regexp=>/^Jigsaw/, :search=>"headers[server]" },
	{ :version=>/^Jigsaw\/([^\s]+)$/, :search=>"headers[server]" },
	
]

end

