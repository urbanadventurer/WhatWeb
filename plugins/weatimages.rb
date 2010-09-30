##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Weatimages" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "Weatimages is very easy to use program that allows you to organize powerful web-based photo albums on your website in a minimal time. To publish photo album you just need to put one file from Weatimages distributive to a separate website directory containing your photos or folders (which become sub-albums) with your photos. - homepage: http://nazarkin.name/projects/weatimages/"

# 289 results for "powered by Weatimages" @ 2010-08-28
# 129 results for "powered by Weatimages" intitle:Albums @ 2010-08-28
examples %w|
www.nazarkin.name/projects/weatimages/demo/index.php
www.latsabidze.com/pics/index.php
www.mykhanna.com/gallery/index.php
gotoimage.com/hosted/
ga2k.com
fot.kudzia.eu
www.lucindaart.com/gallery/
www.gregsullivan.org/images/
www.inaguamainhouse.com/gallery.php
pb.ueberl33t.net/fun/gallery/index.php
www.andrewadams.com
sandhaanu.net/raajjecup/index.php
www.thesaphere.com/photos_misc/index.php
ihatebottles.com/gallery/
www.logodesignweb.com/stockphoto/nature/animals2/
www.risashoebox.com/gallery/
sisgi.site40.net
www.joneman.com/weatimages/index.php
www.hinis.bel.tr/images/album/index.php
mickej.se/gallery/
affiliatemashupstore.com/screens/index.php
www.stardotstar.co.in/gallery/index.php
www.taylormadehardwoodfloors.com/photos/index.php
www.ogormanhomeimprovements.com/images/index.php
www.aight.se/breeder/index.php
photos.damnleet.com/index.php
www.sweetcornz.net/Gallery/Sunrise_Sunset/index.php
www.incounters.net/photo_gallery/index.php
ga2k.com/gallery/index.php
www.wildskiesoutfitting.com/photos/index.php
filmanley.com/photography/index.php
www.crccphotos.com/index.php
arjuna-abi.com/Registration/index.php
www.thurens.com/photoalbum/index.php
www.shawnjordan.com/index.php
plainsimple.dk/dump/index.php
section9.hu/index.php
daniela-thelen.net/gallery/public/index.php
www.whiteside.me.uk/photos/index.php
www.zuiderbaan.com/photo/index.php
www.blankdesigns.org/templates/index.php
whdh.gamsofgold.com/2008/dylan_d/photos/index.php
jimfields.us
www.bandalaestrella.com/weatimes/index.php
www.nextutah.com/flyers/
www.redrock.ch/picture/index.php
www.coralbark.com/ofelia/stills/noflash/index.php
photo.spodniak.cz/index.php
www.gregsullivan.org/images/index.php
|

matches [

# CSS
{ :text=>'<div align="center" class="weatimages_toppest_navig" style="text-decoration:underline;">' },

# Meta generator
{ :text=>'<meta name="Generator" content="Weatimages"/>' },

# Powered by text
{ :text=>'Powered by <a href="http://nazarkin.name/projects/weatimages/">Weatimages</a>' },

]

end

