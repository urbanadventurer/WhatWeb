##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Videosmate-Organizer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-29
version "0.1"
description "Videosmate Organizer - Organize your favorite YouTube & Vimeo Videos on your own site in minutes. The script contains an API that can pull videos automatically from YouTube to your site based on the channel name or keywords that you enter.  - Homepage: http://videosmate.com/"

# Google results as at 2011-08-29 #
# 71 for "Powered by Videosmate Organizer Version" Login. Username: Password: Sign Up

# Dorks #
dorks [
'"Powered by Videosmate Organizer Version" Login. Username: Password: Sign Up'
]

# Examples #
examples %w|
www.videosmate.com/componentdemo/
nickynicknytv.com/wp-content/wp_vm/category_finder.php
www.megavdos.in
maybachmusic.net/videos/
www.teluguspoofs.com
maybachmusic.net/videos/
www.qawrascoutgroup.org/qawratube/
www.digiflux.com/videosmate/
www.shapeshift.tv
findncr.com/entrtainment/video/
videorecipes.info
howdoitieatie.info
subtitle-movies.com
elvisongs.com
discovermagicmushrooms.com
coffee-video.com
www.armnetwork.com
tv.nsk.pl
www.hmongchannel.com
www.kookrecepten.tv
|

# Matches #
matches [

# HTML Comments
{ :text=>'</div> <!-- /content-in -->' },
{ :text=>'<!-- script Downloaded from http://videosmate.com -->' },

# Year Detection # HTML Comment
{ :string=>/<!--Copyright (20[\d]{2}),Videosmate Organizer[\s]+Downloaded from http:\/\/videosmate\.com/ },

# Version Detection # HTML Comment
{ :version=>/<!-- LICENSED Version  Videosmate ORGANIZER, Ver\.([^\s]+) -->/ },

# Version Detection # Powered by footer
{ :version=>/<a href=http:\/\/videosmate\.com><font color=#ffffff>Powered&nbsp;by&nbsp;Videosmate&nbsp;Organizer&nbsp;Version&nbsp;([^\s^&]+)&nbsp;Copyright&nbsp;&copy;&nbsp;(20[\d]{2})<\/a>/ },

# Year Detection # Powered by footer
{ :string=>/<a href=http:\/\/videosmate\.com><font color=#ffffff>Powered&nbsp;by&nbsp;Videosmate&nbsp;Organizer&nbsp;Version&nbsp;([^\s^&]+)&nbsp;Copyright&nbsp;&copy;&nbsp;(20[\d]{2})<\/a>/, :offset=>1 },

]

end

