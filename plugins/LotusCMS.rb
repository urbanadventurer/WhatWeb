##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LotusCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "LotusCMS (previously ArboroianCMS) brings to the forefront design and design integration into one of the most neglected CMS niches - Databaseless Web-Design and Development. - Homepage: http://www.lotuscms.org/"

# Google results as at 2011-03-16 #
# 10 for intitle:"LotusCMS Administration"
# 63 for "Powered by LotusCMS"

# Examples #
examples %w|
www.lotuscms.org/index.php?system=Admin
demo.opensourcecms.com/lotuscms/index.php?system=Admin
demo.opensourcecms.com/lotuscms/
www.waterboysuw.com
techresq.net/lotus/
lotuscms.welovewebdesign.com
www.melonkore.co.cc/lcms/
www.truth.outnowhere.com
www.arboroia.com
libreriaamor.rapiagenda.com
simbiosi.org
pankrol.herobo.com/lotus/
jnns.net
www.gi.alaska.edu/~chha/cms/
littaandersen.dk
slnt.fr/lcms/
www.svenstringer.com
www.psychotronika.szkola.pl
aepfel.ch
fotki.netserwer.pl
www.kartynylvovagoldeye.abajt.pl/lotos/LotusCMS/
todai-tsa.org
www.unitradedubai.com/admin/
rashid.comxa.com/admin/
faya-dance.nl/index.php?system=Admin
www.eichberger.org/admin/
|

# Matches #
matches [

# Powered by text
{ :text=>'Powered by: <a href="http://www.lotuscms.org">LotusCMS</a>' },
{ :text=>'Powered by <a href="http://www.arboroia.com/cmsproject/">ArboroianCMS</a>' },

# Menu
{ :text=>"<ul><li><a class='firstM' href='index.php?page=index'>Home</a></li><li><a class='normalM' href='index.php?system=" },

# Admin Page # Title
{ :text=>'<title>LotusCMS Administration</title>' },
{ :text=>'<title>.:Lotus Administration:.</title>' },

# Admin Page # Form
{ :text=>'<form method="POST" action="index.php?system=Admin&page=loginSubmit" id="contactform">' },

# HTML Comment
{ :text=>"<!-- Please don't delete this. You can use this template for free and this is the only way that you can say thanks to me -->" },

# Meta Keywords
{ :certainty=>25, :text=>'<meta name="keywords" content="LotusCMS" />' },

]

end


