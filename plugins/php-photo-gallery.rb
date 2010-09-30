##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Photo-Gallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "Easily create your own photo album on the internet. With the easy installation you can have your gallery up and running within 5 minutes with unlimited albums and photos. - homepage: http://phpweby.com/software/gallery"

# 40 results for "Powered by PHP Photo Gallery" @ 2010-08-29
examples %w|
album.mtt.bg/photo.php
album.ojamaa.ee/photo.php
eliteconcretedesign.net/v10/photo.php
lakecheer.com/album/index.php
lawyerseverett.com
movementexplorers.com/gallery/photo.php
photo.urbanfishingshow.com/photos/
tulsa2u.com
www.thevoiceofpeace.co.il/gallery2/photo.php
www.well.hr/polovno/contact.php
www.bijon.fr/photo.php
www.gncommunitycentre.org/gall/photos/
wwwnno.moph.go.th/web_ssj/photogall/photo.php
www.oneinchdeep.com/photo.php
www.tpv-brigerbad.ch/new_gallery/index.php
www.urbanfishingshow.com/photo/
www.karperteamstadskanaal.nl/test/index.php
www.krumblez.co.uk
www.reedme.org
www.mediosparalelos.com/criollos/photos/
www.manoogian.org/gallery/index.php
www.loaded-dog.co.uk/photo.php
|

matches [

# Powered by text
{ :text=>'Powered by <a href="http://phpweby.com/software/gallery">PHP Photo Gallery</a>' }, # &copy; 2009 <a href="http://phpweby.com">PHP Weby</a><br />

{ :text=>'Powered by <a href="http://phpweby.com">PHP Photo Gallery</a>' },

]

end

