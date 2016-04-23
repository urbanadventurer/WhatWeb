##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netjuke" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-13
version "0.1"
description "Netjuke is a Web-Based Audio Streaming Jukebox"
website "http://sourceforge.net/projects/netjuke"

# Google results as at 2012-07-13 #
# 13 for inurl:"search.php?do=list.tracks"

# Dorks #
dorks [
'inurl:"search.php?do=list.tracks"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Start Primary Header -->' },
{ :text=>'<!-- Begin Primary Footer -->' },

# JavaScript # onClick
{ :text=>"onClick=\"window.open('alphabet.php?do=alpha.artists','NetjukeRemote'" },

]

end

