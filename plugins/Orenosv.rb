##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Orenosv" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-09
version "0.2"
description "Orenosv is a stable, reliable and high performance HTTP/FTP/FTPS file server that can operate in 24H/365D. Orenosv runs on Windows platforms (NT, 2000, XP and 2003) and Linux x86. "
website "http://www.orenosv.com/orenosv_en.html"

# ShodanHQ results as at 2011-06-09 #
# 18 for orenosv
# All results are from Japan

matches [
	
	# HTTP Server Header
	{ :version=>/^orenosv/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^orenosv\/([^\s]+)$/, :search=>"headers[server]" },

]

end

