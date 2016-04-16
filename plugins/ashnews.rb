##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated version detection method
##
Plugin.define "ashnews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "ashnews is a simple program using PHP/MySQL that allows you to easily add a news/blog system to your site."
website "http://projects.ashwebstudio.com/"

# 19 results for "News powered by ashNews" -allinurl -Vulnerabilities @ 2010-08-28



# Matches #
matches [

	# Version Detection # powered by text
	{ :version=>/<td align="center"><font face=Arial size=1>News powered by <a href=http:\/\/projects.ashwebstudio.com>ashnews v([\d\.]+)<\/a><\/font><\/td>/ },

]

end

