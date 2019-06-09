##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CaupoShop-Classic"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-08-29
  # v0.2 # 2011-01-23 # Updated version detection. 
  "Andrew Horton", # v0.3 # 2016-04-17 # Added website parameter and description. 
]
version "0.3"
description "German eCommerce and Content management system"
website "http://www.caupo.net/"

# Google results as at 2010-08-29 #
# 6   for "powered by CaupoShop Classic ver"
# 121 for "powered by CaupoShop Classic"
# 217 for inurl:csc_articles.php

# DOrks #
dorks [
'"powered by CaupoShop Classic"',
'inurl:csc_articles.php'
]



# Matches #
matches [

	# GHDB # URL pattern
	{ :ghdb=>'inurl:csc_articles.php', :certainty=>25 },

	# Powered by text
	{ :regexp=>/<td align="center"><small>&copy; 1998\-?[0-9]{0,4} <a href="http:\/\/www.caupo.net" target="_blank">CaupoNet<\/a>/ },

	# Powered by text
	{ :regexp=>/<td align="center"><small>Powered by CaupoShop Classic[\s]?<\/small><\/td>/ },

	# Powered by text # Version Detection
	{ :version=>/<td align="center"><small>Powered by CaupoShop Classic Ver\. ([\d\.]+)<\/small><\/td>/ },

	# HTML Comment
	{ :version=>/<!-- CaupoShop Classic Ver\. ([\d\.]+) \([\d]{4}-[\d]{2}-[\d]{2}\)/ },

]

end

