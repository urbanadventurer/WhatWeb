##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "webSPELL" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "webSPELL is a free Content Management System which was especially developed for the needs of esport related communities. - Homepage: http://www.webspell.org/"

# Google results as at 2011-03-14 #
# 92 for "this site is using the webspell script version" -dork

# Examples #
examples %w|
www.webspell.org/blutengeladmin.bl.ohost.de/index.php?site=imprint
www.webspell.org/freetddragon.fr.funpic.de/index.php?site=imprint
www.webspell.org/blog.bonehost.de/index.php?site=imprint
www.unleashed-clan.com/index.php?site=imprint
www.ab-caravan-zubehoer-shop.de/index.php?site=imprint
www.3cr3w.net/index.php?site=imprint
www.battlefield3.cc/index.php?site=imprint
imangascans.org/index.php?site=imprint
www.pension-sophia.com/index.php?site=imprint
www.kurzhagen.de/index.php?site=imprint
www.mrunbekannt.eu/index.php?site=imprint
www.dj-fantazy.de/index.php?site=imprint
www.the-members-of-darkness.de/index.php?site=imprint
dreams-gaming.ru/index.php?site=imprint
fragenerate.org/index.php?site=imprint
www.dj-fredup.de/?site=imprint
mw2tournaments.com/index.php?site=imprint
www.ultragaming.eu/index.php?site=imprint
www.ivackov.com/index.php?site=imprint
www.koczott.de/index.php?site=imprint
www.pro-buehnentechnik.de/index.php?site=imprint
www.patrick-kreutz.de/index.php?site=imprint
www.banzai-carhifi.de/index.php?site=imprint
www.leicht-schraeg.de/index.php?site=imprint
www.fc-fortuna-schatthausen.de/fc/index.php?site=imprint
www.aaclan.nl/index.php?site=imprint
www.edeng.de/index.php?site=imprint
www.mrc-abtenau.at/index.php?site=imprint
www.felgenstyle.de/page/index.php?site=imprint
fiese-greise.de/index.php?site=imprint
www.andreacalvani.it/index.php?site=imprint
www.fc-eiche-sippersfeld.de/index.php?site=imprint
www.the-phoenix-club.net/index.php?site=imprint
zorn-gaming.org/index.php?site=imprint
www.the-360-degree-pleasure.at/?site=imprint
www.umke.de/index.php?site=imprint
www.dwe-gaming.info/index.php?site=imprint
9volt-gaming.de/index.php?site=imprint
www.radlerpension-bormann.de/index.php?site=imprint
www.meine-wohlfuehlzeit.de/index.php?site=imprint
www.ufb-lam.eu/ufb/index.php?site=imprint
templinerfungamer.ucct.net/index.php?site=imprint
www.schule-wirtschaft-los.de/index.php?site=imprint
www.ecf-power.de/ecf/index.php?site=imprint
www.clan-black-swans.de/index.php?site=imprint
www.server4lau.eu/index.php?site=imprint
cryogens.tym.sk/index.php?site=imprint
www.gmapper.at/index.php?site=imprint
redarmycup.xenax.be/index.php?site=imprint
restinfo.co.de/index.php?site=imprint
bufu14.bu.funpic.de/babou/index.php?site=imprint
bobbyracer.bo.funpic.de/clanpage/index.php?site=imprint
www.awp-community.eu/index.php?site=imprint
wwww.bloodyrevenge.co.de/index.php?site=imprint
www.deluxe-racer.de/index.php?site=imprint
www.auspuff-doc.de/Auspuff/index.php?site=imprint
www.bottroper-buch.de/index.php?site=imprint
clan-zolo.kiesp.dk/?site=imprint
mdclan.de/homepage/index.php?site=imprint
www.rizzard.de/index.php?site=imprint
www.tmihvw.de/TMI/index.php?site=imprint
war.mythdrannor.de/index.php?site=imprint
www.doerrenhaus.com/englisch/index.php?site=imprint
bw-tagebuch.de/index.php?site=imprint
freakso.fr.funpic.de/index.php?site=imprint
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="webSPELL" />' },

# Version Detection # This site is using link
{ :version=>/This site is using the <a href="http:\/\/www.webspell.org" target="[^"]+">webSPELL (Free Content Management System|script) \(version: ([^\)]+)\)[\s]*<\/a>/, :offset=>1 },

# Version Detection # This site is using link # German
{ :version=>/Diese Seite benutzt das <a href="http:\/\/www.webspell.org" target="[^"]+">webSPELL Script \(Version: ([^\)]+)\)[\s]*<\/a>/ },

]

end


