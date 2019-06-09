##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "FrontPage-Extensions"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-26
  # v0.2 # 2011-06-04 # Updated regex. Renamed from FrontPage to FrontPage-Extensions. 
  "Andrew Horton", # v0.3 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.3"
description "Microsoft FrontPage (full name Microsoft Office FrontPage) is a WYSIWYG HTML editor and web site administration tool from Microsoft for the Microsoft Windows line of operating systems. This plugin identifies the FrontPage HTTP server header which is indicates the presence of FrontPage extensions."
website "http://office.microsoft.com/en-au/frontpage-help/"

# More Info #
# http://en.wikipedia.org/wiki/Microsoft_FrontPage

# ShodanHQ results as at 2010-10-26 #
# 1,148,067 for "server: Frontpage"

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/FrontPage\/([^\s]+)/, :search=>"headers[server]" },
	{ :regexp=>/^FrontPage/, :search=>"headers[server]" },
]

end

