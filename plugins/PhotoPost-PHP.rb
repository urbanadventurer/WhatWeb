##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PhotoPost-PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "PhotoPost is photo sharing gallery software for your site that lets your users upload photos to galleries and to interact in photo discussions. Install it yourself, or let us get your gallery up and running in one day. - homepage: http://www.photopost.com/"

# 262 results for "powered by PhotoPost PHP" @ 2010-09-18
examples %w|
www.photopost.com/photopost/adm-index.php
www.photographyblog.com/gallery/index.php
www.photographyblog.com/gallery/adm-misc.php?admact=mainmenu
starcraft.incgamers.com/gallery/showgallery.php
starcraft.incgamers.com/gallery/adm-index.php
toyfair2010.figures.com/showgallery.php
toyfair2010.figures.com/adm-index.php
classicvanhalen.com/photopost/
forum.surfermag.com/photopost/
gallery.anipike.com
www.planetmolosser.com/gallery/
www.rcflix.com/photopost/index.php
www.theocshow.com/photopost/index.php
www.classiccar.com/photopost/index.php
www.jdmuniverse.com/forums/gallery/index.php
www.tropicalfishforum.net/photopost/
www.icompact.com/gallery/
www.pashweddings.com/gallery/index.php
www.mustangphotos.com/photopost/
www.onesixthwarriors.com/photo/index.php
www.fotoscraps.com/gallery/index.php
www.christina-a.net/gallery/
www.scrapvillage.com/gallery/
|

matches [

# Admin page # Default title
{ :text=>'<title>PhotoPost Administration Menu</title>' },

# Admin page # Default frameset HTML
{ :text=>'<frame name="mainFrame"  src="adm-misc.php?admact=mainmenu" scrolling="yes" frameborder="0" marginwidth="0" marginheight="0" border="no" />' },

# Powered by text
{ :text=>'Powered by: <a target="_blank" href="http://www.photopost.com">PhotoPost</a> PHP<br />' },
{ :text=>'Powered by: <a target="_blank" href="http://www.photopost.com">PhotoPost</a> PHP vB3 Enhanced<br />' },

# Default title
{ :text=>' - Powered by PhotoPost</title>' },

]

end

