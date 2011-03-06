##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TFTgallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "TFTgallery is a PHP based web image gallery which doesn't need a database. It uses the directory structure for data storage. The main features are: an on-the-fly thumbnail creation, PDF and ZIP creation, image calendars, EXIF support. - Homepage: http://www.tftgallery.org/"

# Google results as at 2011-02-27 #
# 39 for intitle:"TFTgallery administration"

# Examples #
examples %w|
www.tftgallery.org/demo/
www.tftgallery.org/?content=includedgallery
www.tftgallery.org/demo/admin/index.php
recumbentcountry.osgoodeonline.com/tftgallery1/admin/index.php
www.sandysofas.osgoodeonline.com/tftgallery/admin/index.php
zandvoort.photoalbum80.com/admin/index.php
france.photoalbum80.com/admin/index.php
www.minkhollow.ca/mhf/tft/admin/index.php
www.silvershoreswaterfront.com/gallery/admin/index.php
gsaggior.ifmw.mobi/tftgallery/admin/index.php
www.rozemarie.nl/tftgallery/admin/index.php
www.markwinpetresort.com/gallery/admin/index.php
www.ilynda.com/gallery/admin/index.php
havanada.com/gallery/admin/index.php
www.aidanconstruction.com/tftgallery/admin/index.php
www.newfieweb.com/angus/admin/index.php
gingerichconstruction.net/COLES-DUNGEON/gallery/admin/index.php
mike.fotogeeks.com/admin/index.php
bev.fotogeeks.com/admin/index.php
randy.fotogeeks.com/admin/index.php
foto.kolla.no/admin/index.php
shadow.spb.ru/tft/admin/index.php
www.benburko.com/gallery/admin/index.php
www.upwind.com.br/galeria3/admin/index.php
jm.me.cz/fotky/admin/index.php
www.soshelmond.nl/TFTgallery/admin/index.php
www.wimfreriks.nl/gallery/admin/index.php
www.sellebjerg.dk/byg/admin/index.php
bakaliowakraina.pl/pepe/admin/index.php
www.ppmhp.hr/gallery/admin/index.php
www.robinu.com/gallery/admin/index.php
www.vorf.se/tftgallery/admin/index.php
|

# Matches #
matches [

# Default select tag
{ :text=>'Select an album: <select name="album" onchange="javascript:document.tftnavi.submit();"><option></option>' },

# Admin Page # Default Title
{ :text=>"<title>TFTgallery administration</title><link rel='stylesheet' type='text/css' href" },

# Admin Page # Back to gallery link
{ :text=>'<div class="login_text"><br /><a href="../index.php">back to the gallery</a></div>' },

# Default Logo
{ :regexp=>/<td class='footer_right'><a href='http:\/\/www.tftgallery.org\/' target='_blank'><img src="[^"]*images\/TFTgallery.png" alt="TFTgallery" border="0" \/><\/a><\/td>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="TFTgallery ([\d\.]{1,5}) http:\/\/www.tftgallery.org\/" \/>/ },

]

end


