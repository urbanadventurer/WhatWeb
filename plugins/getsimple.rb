##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "GetSimple" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "GetSimple is an open source CMS that utilizes the speed and convenience of XML, a best-in-class UI and the easiest learning curve of any simple Content Management System out there."
website "http://get-simple.info/"

# 389 results for "powered by getsimple Version" @ 2010-08-28



# Matches #
matches [

	# Version Detection # Meta Generator
	{ :version=>/	<meta name="generator" content="GetSimple \- ([\d\.\_A-Z]+)" \/>/ },

	# Version Detection # Powered by text
	{ :version=>/<a href="http:\/\/get-simple.info\/" title="Open Source and Free CMS" >Powered by GetSimple<\/a> Version ([\d\.\_A-Z]+)/ },

	# Admin Page # Version Detection # Powered by text
	{ :version=>/<a href="http:\/\/get-simple.info\/">Powered by GetSimple<\/a> Version ([\d\.\_A-Z]+)/ },

]

end

