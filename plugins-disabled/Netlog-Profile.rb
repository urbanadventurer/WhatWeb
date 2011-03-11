##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netlog-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, location, DOB and friends' names from their Netlog profile - homepage: http://netlog.com/"

# About 1,340,000 results for site:en.netlog.com -inurl:"/go/" @ 2011-01-16

# Examples #
examples %w|
http://en.netlog.com/coolgirl_sa
http://en.netlog.com/sex96
http://en.netlog.com/insaishable
http://en.netlog.com/hayfa_lonlygirl
http://en.netlog.com/BelleBlonde21
http://en.netlog.com/rcsa_lover
http://en.netlog.com/nuchBooty
http://en.netlog.com/cute_girl_958
http://en.netlog.com/muffinbabe15
http://en.netlog.com/razan931
http://en.netlog.com/eco_gril
http://en.netlog.com/girl_co0o0l
http://en.netlog.com/Nightgirlll
http://en.netlog.com/girllovely1990
http://en.netlog.com/zozotata
http://en.netlog.com/Angellove_27love
http://en.netlog.com/girllly19
http://en.netlog.com/2girl1cup/
http://en.netlog.com/gogolez/
http://en.netlog.com/jessie258/
http://en.netlog.com/dreamgirlroma
http://en.netlog.com/xamazinggirlx
http://en.netlog.com/golsa_emdadi/
http://en.netlog.com/innocet
http://en.netlog.com/gurlzgirl/
http://en.netlog.com/sweety_girl_te/
http://en.netlog.com/loquitagirl/
http://en.netlog.com/emo_girl66621
|

# Matches #
matches [

	# Name :
	{ :version=>/<dt>Name<\/dt>[\W]*<dd>[\W]*([^<]*)[\W]*</ },

	# Location :
	{ :string=>/<dt>Location<\/dt>[\W]*<dd>[\s]*([^<^\r^\n]*)</ },

	# DOB :
	{ :model=>/<dt>Date of birth<\/dt>[\W]*<dd>([0-9\/]{10})[\W]*</ },

	# Friends :
	{ :filepath=>/<a href="\/([^\"]*)" title="[^\"]*" class="nick person" rel="friend">/, :module=>"Public Profile" },

]

end


