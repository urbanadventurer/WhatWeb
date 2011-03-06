##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tagged-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's username and basic info from their Tagged profile - homepage: http://github.com/"

# About 87,400 results for site:www.tagged.com intitle:"Tagged - * Profile" -ext:html

# Examples #
examples %w|
http://www.tagged.com/rickymartinswife
http://www.tagged.com/gay_diapered_bear_on_wheels
http://www.tagged.com/vladimaroco
http://www.tagged.com/princess019
http://www.tagged.com/milendpark
http://www.tagged.com/mdqayyum
http://www.tagged.com/mama1919
http://www.tagged.com/vietnamtour
http://www.tagged.com/love2009love
http://www.tagged.com/ravery334
http://www.tagged.com/nicebutt
http://www.tagged.com/jokeredrum
http://www.tagged.com/chelseyessmatee
http://www.tagged.com/kittylarue
http://www.tagged.com/juggalo4eva93
http://www.tagged.com/fetishgirl
http://www.tagged.com/tyti3113
http://www.tagged.com/nazie_may
http://www.tagged.com/forensicsgal
http://www.tagged.com/red_1432
|

# Matches #
matches [

	# Name :
	{ :version=>/<h1><span id="page_displayname_text">([^<]*)<\/span><\/h1>/ },

	# Photos :
	{ :model=>/<li id="item_view_photos"><a class="icon photos" id="link_view_photos" href="\/photo_gallery.html\?uid=[0-9]*" title="View ([^\"]*)"/ },

	# Gender :
	{ :string=>/<p><label>Gender:<\/label> <span id="basic_info_genderString">([^<]*)<\/span><\/p>/, :module=>"Public Profile" },

	# Ethnicity :
	{ :string=>/<p><label>Ethnicity:<\/label> <span id="basic_info_userEthnicities">([^<]*)<\/span><\/p>/, :module=>"Public Profile" },

	# Religion :
	{ :string=>/<p><label>Religion:<\/label> <span id="basic_info_religion">([^<]*)<\/span><\/p>/, :module=>"Public Profile" },

	# Orientation :
	{ :string=>/<p><label>Orientation:<\/label> <span id="basic_info_orientation">([^<]*)<\/span><\/p>/, :module=>"Public Profile" },

]

end


