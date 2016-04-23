##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Xerver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.2"
description "Xerver is an advanced free GNU GPL Web and FTP server."
website "http://www.javascript.nu/xerver/"

# ShodanHQ results as at 2011-05-20 #
# 182 for Xerver

matches [
	
	# HTTP Server Header
	{ :regexp=>/^Xerver/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Xerver\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

