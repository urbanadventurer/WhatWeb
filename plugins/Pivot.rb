##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pivot" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-18
version "0.1"
description "Pivot is a web-based tool to help you maintain dynamic sites, like weblogs or online journals. - Homepage: http://www.pivotlog.net/"

# 26 for "Set up the Administrator User" +Username +"Password (confirm)" +confirm +Email +Nickname

# Dorks #
dorks [
'"Set up the Administrator User" "Username" "Password (confirm)" "confirm" "Email" "Nickname"'
]

# Examples #
examples %w|
www.undereternityblue.com/seva/pivot/index.php
bibliotheek.pivot.cc/pivot/
ecumenici.altervista.org/html/pivot/index.php
dawnanddrew.podkeyword.com/pivotblog/pivot/
soulcookie.podkeyword.com/pivotblog/pivot/
reviews.podkeyword.com/pivotblog/pivot/
openpodcast.podkeyword.com/pivotblog/pivot/
marchon.podkey.com/pivotblog/pivot/
technology.podkey.com/pivotblog/pivot/
www.podkey.com/pivotblog/pivot/
jakokru.wz.cz/web/pivot/
members.iinet.net.au/~tealou/public_html/pvblog/pivot/
koen.logt.org/pivot/
members.multimania.nl/elninofxp/pivot/index.php
marchonscorner.podkey.com/pivotblog/pivot/
david.podkeyword.com/pivotblog/pivot/
portalette.podkeyword.com/pivotblog/pivot/
toverknoop.nl/pivot/
www.computerblondie.nl/pivot/
atila.irb.hr/weblog/pivot/
|

# Matches #
matches [

# HTML Comment
{ :certainty=>25, :text=>"<!-- Includes for Thickbox script -->" },

# Default Title
{ :text=>'<title>Pivot &#187; setup</title>' },

# Pivot Powered default input value
{ :text=>'<td width=\'75%\'><input type="text" name="sitename" value="Pivot Powered" size="40" class="input" /></td>' },

# Version Detection
{ :version=>/<a href="http:\/\/www\.pivotlog\.net\/\?ver=Pivot[^"]+" target="_blank" title="Pivot - ([^:]+): '[^']+'"><img[^>]+alt="Pivot - [^"]+" \/><\/a>/ },

]

end


