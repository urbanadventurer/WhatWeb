##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Myspace-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, location, age, gender and their friends' names from their Myspace profile - homepage: http://myspace.com/"

# Notes #

	# Support for profiles using the classic theme is dismal at best.

# About 119,000,000 results for site:myspace.com intitle:"on myspace" @ 2011-01-16

# Examples #
examples %w|
http://www.myspace.com/barackobama
http://www.myspace.com/5879
http://www.myspace.com/joannaabdank
http://www.myspace.com/britneyspears
http://www.myspace.com/alexademara
http://www.myspace.com/1hef
http://www.myspace.com/topmodelprofiles
http://www.myspace.com/charlie301
http://www.myspace.com/Laurensantoine
http://www.myspace.com/fhmonline
http://www.myspace.com/dianachiafair
http://www.myspace.com/Carlee
http://www.myspace.com/bonnieconte
http://www.myspace.com/therealmercedesterrell
http://www.myspace.com/ilovekandyce
http://www.myspace.com/erikanicole2011
http://www.myspace.com/theofficialerinmcnaught
http://www.myspace.com/tonileigh
http://www.myspace.com/5659
|

# Matches #
matches [

	# Name :
	{ :version=>/<meta name="description" content="([^&]*)&#39;s profile on Myspace, the leading social entertainment destination powered by the passion of our fans." \/>/ },

	# Age :
	{ :string=>/<li class="tags even"><span class="age">([0-9]+)<\/span> \/ <span class="gender">[^<]*<\/span><\/li><li class="adr odd">/ },

	# Gender :
	{ :string=>/<li class="tags even"><span class="age">[0-9]+<\/span> \/ <span class="gender">([^<]*)<\/span><\/li><li class="adr odd">/ },

	# Location :
	{ :string=>/<li class="tags even"><span class="age">[0-9]+<\/span> \/ <span class="gender">[^<]*<\/span><\/li><li class="adr odd"><span class="locality">([^<]*)<\/span>/ },

	# Region :
	{ :string=>/<li class="tags even"><span class="age">[0-9]+<\/span> \/ <span class="gender">[^<]*<\/span><\/li><li class="adr odd"><span class="region">([^<]*)<\/span>/ },

	# Friends :
	{ :filepath=>/<span class="hcard fn n"><a class="url uid nickname" href="\/[^\"]*">([^<]*)<\/a>/ },
	{ :filepath=>/<div class="miniProfile" data-friendid="[0-9]+" data-title="([\"]*)"/ },

	# Private Profile :
	{ :regexp=>/<p class="sitesCommonSprite sitesComLock sizeS">Sorry,  the profile of [^<]* is only viewable by friends.<\/p>/, :module=>"Private Profile" },

]

end


