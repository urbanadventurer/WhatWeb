##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NaviCOPA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.2"
description "The NaviCOPA Web Server Software installs on any version of the Microsoft Windows operating system from 98 and up, including Windows Vista, and automatically configures itself for instant HTTP access. NaviCOPA does not limit the number of connections and comfortably serves 1000's of simultaneous connections"
website "http://www.navicopa.com/"

# ShodanHQ results as at 2011-03-25 #
# 4 for InterVations

matches [
	
	# HTTP Server Header
	{ :regexp=>/^InterVations NaviCOPA/, :search=>"headers[server]" },
	
	# Version Detection # HTTP Server Header
	{ :version=>/^InterVations NaviCOPA Version ([\d\.]+) [\d]{1,2}[a-z]{2} [A-Z][a-z]+ [\d]{4}$/, :search=>"headers[server]" },
	
	# Set-Cookie
	{  :name=>"NaviCopaSession Cookie", :regexp=>/^NaviCopaSession/, :search=>"headers[set-cookie]" },

]


end

