##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-06-04 #
# Updated regex
# Renamed from FrontPage to FrontPage-Extensions
##
Plugin.define "FrontPage-Extensions" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Microsoft FrontPage (full name Microsoft Office FrontPage) is a WYSIWYG HTML editor and web site administration tool from Microsoft for the Microsoft Windows line of operating systems. This plugin identifies the FrontPage HTTP server header which is indicates the presence of FrontPage extensions. - Homepage: http://office.microsoft.com/en-au/frontpage-help/"

# More Info #
# http://en.wikipedia.org/wiki/Microsoft_FrontPage

# ShodanHQ results as at 2010-10-26 #
# 1,148,067 for "server: Frontpage"

# Examples #
examples %w|
205.234.252.238
69.162.186.70
129.121.38.159
198.104.177.102
74.53.136.101
74.53.225.110
198.104.62.165
174.122.231.220
66.49.171.154
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].to_s.scan(/FrontPage\/([^\s]+)/i).to_s } if @meta["server"].to_s =~ /FrontPage\/([^\s]+)/i

	# Return passive matches
	m
end

end

