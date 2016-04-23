##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Microsoft-WinCE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Microsoft Windows CE HTTP Server"
website "http://msdn.microsoft.com/en-us/library/ms834461.aspx"

# ShodanHQ results as at 2011-03-13 #
# 18,324 for Microsoft-WinCE

matches [
	# HTTP Server Header
	{ :regexp=>/^Microsoft-WinCE/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^Microsoft-WinCE\/([^\s^\r^\n]+)$/, :search=>"headers[server]" },

]


end

