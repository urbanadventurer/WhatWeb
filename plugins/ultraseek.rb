##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Ultraseek" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.2"
description "Ultraseek - web site search engine product information - Homepage [Offline] : http://www.ultraseek.com/"

# ShodanHQ results as at 2011-06-02 #
# 350 for Ultraseek

matches [
	
	# HTTP Server Header
	{ :regexp=>/^Ultraseek/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Ultraseek\/([^\s]+)$/, :search=>"headers[server]" },

]

end

