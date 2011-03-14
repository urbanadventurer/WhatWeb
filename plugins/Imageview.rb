##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Imageview" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Imageview 6 is a 4th generation image gallery script, using AJAX to deliver the best version yet. - Homepage: http://www.blackdot.be/?inc=projects/imageview"

# Google results as at 2011-03-15 #
# 77 for inurl:imageview5
# 63 for inurl:imageview6
# 64 for intitle:"Imageview * :: By Jorge Schrauwen"
# 67 for intitle:"Imageview * :: Help::"

# Examples #
examples %w|
www.blackdot.be/files/demo/imageview6/
www.crazyskills.com/!oldgallery/new/
www.cityofalbany.net/images/
www.vayner.ru/imageview6/
www.lagrange-lecrouzet.com/imageview6/
joerapier.com/htmlsite/imageview6/
www.gorecoquimbo.cl/oremi/simulacro/imageview6/
www.bmw-scene-vib.de/imageview6/
www.uusikaupunki.fi/~jomuuri/imageview6/
www.sds99.nl/imageview6/
unihosting.de/imageview6/
www.mhserver.de/bildergalerie_svfellbach/
wow.machtkampf.com/imageview6/
safeunsound.net/artwork/
gallery.chenangogrange.org
www.jimmy-eifel.de/fotos/
bilder.fc-hirschhorn.de
www.rcworld-ohz.de/gallery/
www.schaefer-swantow.de/Galerie/
www.prinz-andreas.de/bilder/
www.tow-b.de/summer-break/gallery/
www.rappel-zappel.de/galerie/preload.php
claudi-rennt.de/galerie/
gopacker.com/digitalrecall/imageview6/
www.eguy.info/imageview5/help/menu.htm
element-future.net/imageview5/
rlmac.org/imageview5/index.php
www.mesonastorga.com/scripts/imageview5/
www.ssr.au.com/buy/imageView5.php
www.sportpferde-ehning.com/images/imageview5/index.php
www.family-project.com/imageview5/rss-index.php
danyundpete.de/show/
www.t-hermanni.de/imageview5/
www.neunelfer.net/imageview5/
widmerr.wi.funpic.de/imageview5/
semine.se.funpic.de/imageview5/
www.stiansen.org/imageview5/
stiansen.org/imageview5/rss-index.php
www.joerapier.com/htmlsite/imageview5/
www.goldenwokpaleisopeinde.nl/imageview5/
www.martinbuberschule.de/imageview5/
www.brockob.de/imageview5/
www.element-future.de/imageview5/
rogweb.ovh.org/imageview5/
www.discopub-lavie.at/imageview5/
wolfgang-beckroege.de/imageview5/
www.trust-pics.de/imageview5/
dennis.dehoux.be/fotos/imageview5/
www.bg-penzberg.de/imageview5/
www.lrd3.dk/imageview5/
www.dirty-d.de/imageview5/
schuetzenverein.alt.schuetzenverein-buehlertal.de/Imageview5/imageview5/
www.thomas-kloeber.de/imageview5/
www.indiapr.it/imageview5/
www.icychris.co.uk/imageview5/albumview.php
mrkraut.mr.funpic.de/Imageview5-install/imageview5/
www.ferstl-radsport.de/test2/imageview5/albumview.php
|

# Matches #
matches [

# Frameset
{ :regexp=>/<td (width="160"|rowspan="2")><iframe allowtransparency="yes" frameborder="0" height="100%" width="100%" scrolling="auto" title="(frmcontent|frmlist)" name="(frmcontent|frmlist)" src="albumlist.php\?album=[^"]*"><\/iframe><\/td>/ },

# Meta Author
{ :certainty=>25, :text=>'<meta name="author" content="Jorge Schrauwen" />' },

# Frame
{ :text=>'<frame src="preload.php" name="frImageview" id="frImageview" />' },
{ :text=>'<frame src="about:blank" name="iHistoryRecorder" id="iHistoryRecorder" />' },

# Meta Description
{ :version=>/<meta name="description" content="Imageview ([\d]{1}) :: By Jorge Schrauwen \(http:\/\/www.backdot.be\)">/ },

# Link Developer
{ :text=>'<link rel="Developer" href="http://www.blackdot.be" title="Blackdot.be" />' },

# Version Detection # Help Page # Default Title
{ :version=>/<title>Imageview ([\d]{1}) :: Help:: (Administration|Installation|Miscellaneous|User|Welcome|Menu)<\/title>/ },

# Version Detection # Default Title
{ :version=>/<title>Imageview ([\d]{1}) :: (By Jorge Schrauwen|User Settings|Upload Image|Album View|Administration|RSS Feeds|Install)<\/title>/ },

]

end


