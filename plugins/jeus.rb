##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "JEUS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.2"
description "JEUS (Java Enterprise User Solution) is TmaxSoft's Java EE 5 certified e-Business Strategic Platform. It enables the efficient creation and implementation of a wide variety of rich user-oriented web applications, facilitates SOA concepts (Service Oriented Architecture), and provides a variety of enterprise system functions such as transaction control, session management, and distributed session clustering."
website "http://us.tmaxsoft.com/jsp/product/detailcontents.jsp?psCd=00PD04&menuCd=00PDMSJE"

# ShodanHQ results as at 2011-05-12 #
# 1,543 for Jeus WebContainer
# Most results are from Korea

matches [
	{ :regexp=>/^Jeus WebContainer/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^Jeus WebContainer\/([\d\.]+)$/, :search=>"headers[server]" },
	{ :version=>/^Jeus WebContainer\/JEUS (.+)$/, :search=>"headers[server]" },
	
]

end

