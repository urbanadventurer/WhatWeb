##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Microsoft-WinCE"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-13
  "Andrew Horton", # v0.2 # 2016-04-21 # Moved patterns from passive function to matches[]. 
  "Andrew Horton", # v0.3 # 2019-07-10 # Fix warning: character class has duplicated range
]
version "0.3"
description "Microsoft Windows CE HTTP Server"
website "http://msdn.microsoft.com/en-us/library/ms834461.aspx"

# ShodanHQ results as at 2011-03-13 #
# 18,324 for Microsoft-WinCE

matches [
	# HTTP Server Header
	{ :regexp=>/^Microsoft-WinCE/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^Microsoft-WinCE\/([\S]+)/, :search=>"headers[server]" },

]


end

