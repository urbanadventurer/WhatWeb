##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Musicbox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Musicbox is a web application for managing a songs database."
website "http://www.musicboxv2.com/"

# Google results as at 2011-07-27 #
# 111 for inurl:genre_artists.php
#   5 for "Welcome to Musicbox Version" "Administration Control Panel"

# Dorks #
dorks [
'inurl:genre_artists.php'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- THE FOLLOWING IS NEEDED FOR THE AUTO-COMPLETE SEARCH BOX -->' },

# CSS
{ :text=>'<link rel="stylesheet" href="template/musicboxv2.css" type="text/css">' },

# HTML Comment
{ :text=>'<!-- Please dont edit this unless you are advanced coder -->' },

# Version Detection # Footer
{ :version=>/<tr><td align="center"> <a href="http:\/\/www\.musicboxv2\.com" target="_blank">Musicbox<\/a> Version ([^\s]+)&copy; 20[\d]{2}/ },

# Admin Page # My Account Link
{ :text=>"<tr><td align='left'><a href='../userinfo.php?user=admin' target='_blank'>My Account</a></td>" },

# Admin Page # Version Detection # Heading
{ :version=>/<div id='logomain'><div id='logotopmain'><div style='font-weight:bold;font-size:12px;color:#000;padding-top:14px;padding-left:4px'>Welcome to Musicbox Version ([^\s]+) Administration Control Panel<\/div>/ },

# Admin Page # Version Detection # Footer
{ :version=>/<div id='tdrow5' align=center><br>Musicbox Version ([^\s]+) @ 20[\d]{2} - <a href="http:\/\/www\.MusicboxV2\.com">MusicboxV2\.com<\/a> - Shalwan Entperises<\/div><br><br>/ },

]

end

