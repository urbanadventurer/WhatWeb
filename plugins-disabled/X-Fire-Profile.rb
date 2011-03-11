##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Fire-Profile" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-10
version "0.1"
description "This plugin extracts a person's username, nickname, real name and system details from their X-Fire profile - homepage: http://xfire.com/"

# Google results as at 2011-02-09 #
# 238,000 for inurl:profile site:xfire.com

# Examples #
examples %w|
www.xfire.com/profile/troublegirl/
www.xfire.com/profile/toonoki/
www.xfire.com/profile/kayish/
www.xfire.com/profile/twipps/
www.xfire.com/profile/sexiangel0510/
www.xfire.com/profile/fantilswift/
www.xfire.com/profile/xxkittyreowxx/
www.xfire.com/profile/fluxie32/
www.xfire.com/profile/mizkitten/
www.xfire.com/profile/imzady79/
www.xfire.com/profile/le0nka/
|

# Matches #
matches [

# Meta Description
{ :text=>"<meta name='description' content='Gaming history, personal info, screenshots and more about " },

# Meta Keywords
{ :text=>"<meta name='keywords' content='gaming history, personal info, game hours, screenshots, " },

# System details
{ :string=>/<td><div class="gaming_rig_content">(.*)<\/div><\/td>/ },

# Username
{ :version=>/	<span class="profile_label">\n		Username:\n	<\/span>\n	<span class="profile_data">\n		<a href="\/profile\/[^\/]*\/">([^<]+)<\/a>\n	<\/span>/ },

# Nickname
{ :version=>/	<span class="profile_label">\n		Nickname:\n	<\/span>\n	<span class="profile_data">\n		<a href="\/profile\/[^\/]*\/">([^<]+)<\/a>\n	<\/span>/ },

# Real Name
{ :version=>/	<span class="profile_label">\n		Real Name:\n	<\/span>\n	<span class="profile_data">\n		([^\r^\n]+)\n	<\/span>/ },

]

end


