##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SourceForge-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name and location from their SourceForge profile - homepage: http://SourceForge.net/"

# About 1,740,000 results for site:sourceforge.net intitle:"User Profile" inurl:"sourceforge.net/users/" @ 2011-01-16

# Examples #
examples %w|
http://sourceforge.net/users/earnie/
http://sourceforge.net/users/bcoles/
http://sourceforge.net/users/roseapple/
http://sourceforge.net/users/vgnessvg/
http://sourceforge.net/users/hobbs/
http://sourceforge.net/users/mrego/
http://sourceforge.net/users/vaclavslavik/
http://sourceforge.net/users/mie/
http://sourceforge.net/users/weiju/
http://sourceforge.net/users/andy_j/
http://sourceforge.net/users/kymara/
|

# Matches #
matches [

	# Location :
	{ :string=>/<li class="item"><label>Location:<\/label> ([^<]*)<\/li>/ },

	# Name :
	{ :version=>/<li class="item"><label>Public Name:<\/label> ([^<]*) <\/li>/ },
	{ :version=>/<title>SourceForge.net: ([^<]*) - User Profile<\/title>/ },

]

end


