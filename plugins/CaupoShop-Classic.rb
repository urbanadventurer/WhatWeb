##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-23 #
# Updated version detection
##
Plugin.define "CaupoShop-Classic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.2"
description "homepage: http://www.caupo.net"

# Google results as at 2010-08-29 #
# 6 results for "powered by CaupoShop Classic ver" @ 2010-08-29
# 121 results for "powered by CaupoShop Classic" @ 2010-08-29
# 217 results for inurl:csc_articles.php @ 2010-08-29

# Examples #
examples %w|
www.ugg.de/shop/csc_article_details.php
www.sievers-verlag.de/shop/en/csc_articles.php
www.iskh.de/demoshop/csc_articles.php
shop.sesamnet.ch/shop/csc_articles.php
www.topfkraeuter.de/WebShop/csc_articles.php
www.western-union-band.de/shop/csc_articles.php
www.eurokursmuenzen-schach.de/shop/csc_articles.php
www.life-is-more.at/shop/csc_articles.php
|

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

