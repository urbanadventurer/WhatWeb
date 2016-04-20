##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "iHTML" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.2"
description "iHTML is a server side internet/web programming and scripting language in used by thousands of sites worldwide to deliver cost effective dynamic database driven web sites."
website "http://www.ihtml.com/"

# ShodanHQ results as at 2011-06-04 #
# 593 for iHTML

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/ \(Using iHTML\/([^\)^\s]+)\)/, :search=>"headers[server]" },
	
	# Version Detection # X-Powered-By Header
	{ :version=>/^iHTML\/([^\s]+)$/, :search=>"headers[x-powered-by]" },

]

end

