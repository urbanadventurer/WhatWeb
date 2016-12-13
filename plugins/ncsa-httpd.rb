##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NCSA-HTTPd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "NCSA HTTPd"
website "http://web.archive.org/web/20071020024535/hoohoo.ncsa.uiuc.edu/docs/Overview.html"

# ShodanHQ results as at 2011-03-13 #
# 306 for NCSA -apache -IIS -TakaC

matches [
	# HTTP Server Header
	{ :regexp=>/^NCSA/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^NCSA\/([^\s^\r^\n]+)$/, :search=>"headers[server]" },

]

end

