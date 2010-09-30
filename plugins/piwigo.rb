##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Piwigo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "Piwigo is a photo gallery software for the web, built by an active community of users and developers. - homepage: http://piwigo.org/"

# 271 results for "powered by piwigo" @ 2010-09-12
examples %w|
ru.piwigo.org/demo/
alhudha.net
blankakovacevic.com
brendanjensen.net/photography/index.php
clicknatureindia.com
photos.thezet.com
toths.us/Piwigo/
wireless-sec.com
www.reptilempire.com/photos/picture.php
www.iomcoh.com/pictures/picture.php
www.licks0re-shirts.info/lps/piwigo/
www.aliceodilon.com
www.jpgs.com
www.wilvis.com
www.muza-chan.net/photo/
|

matches [

# Meta generator
{ :text=>'<meta name="generator" content="Piwigo (aka PWG), see piwigo.org">' },
{ :text=>'<meta name="generator" content="Piwigo, piwigo.org">' },

]

end

