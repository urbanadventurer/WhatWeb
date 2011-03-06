##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Facebook-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-15
version "0.1"
description "This plugin extracts a person's name, DOB, homepage, likes and friend's names from their Facebook profile - homepage: http://facebook.com/"

# Notes #

	# Facebook Group pages are not identified.

	# Facebook does not accept the WhatWeb user agent. Change the 
	# user-agent with the -U parameter, eg ./whatweb -U Mozila <URL>

	# Facebook profiles in languages other than English are only partially
	# supported.

# About 160,000,000 results for "Here are some of * friends" site:facebook.com inurl:"people"

# Examples #
examples %w|
http://www.facebook.com/markzuckerberg
http://www.facebook.com/BillGates
http://www.facebook.com/barackobama
http://www.facebook.com/DonaldTrump
http://www.facebook.com/IvankaTrump
http://www.facebook.com/jenn.hawkins
http://www.facebook.com/MeganFox
http://www.facebook.com/DoctorStrangelove
http://www.facebook.com/msi
|

# Matches #
matches [

	# Name :
	{ :version=>/<meta name="description" content="([^>]*) is on Facebook.  Join Facebook to connect with [^>]* and others you may know.  Facebook gives people the power to share and makes the world more open and connected. [^>]* has [0-9]* friends on Facebook/i },
	{ :version=>/<meta name="description" content="Welcome to the official Facebook Page about ([^>]*). Join Facebook to start connecting with [^>]*." \/>/, :module=>"Public Profile" },

	# Likes :
	{ :string=>/<li><a class="psl" href="[^\"]*">([^<]+)<\/a><\/li>/ },

	# Homepage :
	{ :firmware=>/<div><a rel="me" href="([^\"]+)" class="url">/ },

	# DOB :
	{ :model=>/<dt>Birthday:<\\\/dt><dd>([^<]*)<\\\/dd>/, :module=>"Public Profile" },

	# Friends :
	{ :filepath=>/<div class="UIPortrait_Text"><a class="title" [^>]*rel="friend" title="([^>]*)"/i },

]

end


