##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Friendster-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, interesting keywords and friends' names from their Friendster profile - homepage: http://friendster.com"

# About 6,620,000 results for site:profiles.friendster.com intitle:Friendster @ 2011-01-16

# Examples #
examples %w|
http://profiles.friendster.com/109638307
http://profiles.friendster.com/buymicrosoftwindows7
http://profiles.friendster.com/leothemaster
http://profiles.friendster.com/121412361
http://profiles.friendster.com/35567096
http://profiles.friendster.com/122712417
http://profiles.friendster.com/82411881
|

# Matches #
matches [

	# Name
	{ :version=>/<title>Friendster - ([^<]*)<\/title><meta name="description" content="/ },

	# Keywords
	{ :string=>/<meta name="keywords" content="Friendster profile,([^\"]+)">/ },

	# Friends :
	{ :filepath=>/<div class="friendName"><a href="http:\/\/profiles.friendster.com\/[^>]*">([^<]*)<\/a><\/div>/ },

]

end


