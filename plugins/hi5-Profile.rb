##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "hi5-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-16
version "0.1"
description "This plugin extracts a person's name, DOB and location from their hi5 profile - homepage: http://hi5.com/"

# About 257 results for site:*.hi5.com inurl:"friend" intitle:"hi5 - " -"This user is no longer a member of hi5" -intitle:"hi5 - Groups - " @ 2011-01-16

# Examples #
examples %w|
traffyteam.hi5.com
xxghettogueenxx.hi5.com
weimarsalazar.hi5.com
1me2you.hi5.com
dassvalencia.hi5.com
mefistosenordelodio.hi5.com
stillonline.hi5.com
sapitot.hi5.com
caballis.hi5.com
beketamas.hi5.com
jumbuu.hi5.com
venetokleio.hi5.com
michaelanticona.hi5.com
djneo18.hi5.com
jordansxd.hi5.com
braziltour.hi5.com
systopplus.hi5.com
afterhate.hi5.com
|

# Matches #
matches [

	# Private Profile :
	{ :regexp=>/<h1>Private Profile<\/h1>[\W]*<div>[\W]*This user has restricted access to their profile. This means you cannot view their profile unless you are a friend. If you know this person, use the links to the left under the profile photo to send a friend request or a message to them.[\W]*<\/div>/, :module=>"Private Profile" },

	# Name :
	{ :version=>/<meta name="description" content="hi5 Profile page for ([^\(]*) \(/, :module=>"Public Profile" },

	# Location :
	{ :string=>/<meta name="description" content="hi5 Profile page for [^\"]* \(([^\)]*)\)/, :module=>"Public Profile" },

	# Age :
	{ :model=>/<h4 class="box_profile_info_small_heading">[\W]*Age[\W]*<\/h4>[\W]*<div class="box_profile_info_small_content">[\W]*([0-9]+)[\W]*<\/div>/, :module=>"Public Profile" },

	# Birthday :
	{ :model=>/<h4 class="box_profile_info_small_heading">[\W]*Birthday[\W]*<\/h4>[\W]*<div class="box_profile_info_small_content">[\W]*([^\r^\n]*)[\W]*<\/div>/, :module=>"Public Profile" },

]

end


