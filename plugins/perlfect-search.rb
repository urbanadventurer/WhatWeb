##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Perlfect-Search" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "Perlfect Search is a free, sophisticated, powerful, versatile, customizable and effective site indexing/searching suite available under an open source license (GPL). It comes as a pair of distinct scripts. The indexer, that automatically scans and indexes a web site, and the search engine"
website "http://www.perlfect.com/freescripts/search/"

# 20 results for "powered by Perlfect Search" @ 2011-01-16

# Dorks #
dorks [
'"powered by Perlfect Search"'
]



# Matches #
matches [

	# HTML comment
	{ :text=>"<!-- the following meta tag is important to avoid cross site scripting attacks: -->" },

	# Version Detection # Powered by footer
	{ :version=>/Powered by <a href="http:\/\/perlfect.com\/freescripts\/search\/">Perlfect Search ([a-z\.\d]+)<\/a>/ },
	{ :version=>/<a href="http:\/\/perlfect.com\/freescripts\/search\/">Perlfect Search ([a-z\.\d]+) \(c\) Perlfect Solutions 1998-[\d]{4}<\/a>/i },

]

end


