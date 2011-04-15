##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Viscacha" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "Viscacha is a free bulletin board system with an integrated content management system. - Homepage: http://www.viscacha.org/"

# 268 results for "powered by Viscacha"
# 86 for "powered by Viscacha" "The Viscacha Project" inurl:register.php

# Dorks #
dorks [
'"powered by Viscacha" "The Viscacha Project" inurl:register.php'
]

# Examples #
examples %w|
demo.opensourcecms.com/viscacha/
www.dng.st/forum/
ndl.scat-princess.com/viscacha/
birnbeckarts.co.uk
paincity.cwsurf.de
www.puppenworld.de/viscacha4/
deberescolmenaris.com/forum/
peptto.pe.funpic.de
lotusk.lo.funpic.de/Boule/
www.schwerhoerigenforum.de/viscacha/
gladiator.mela.de/gildenforum/
trainer.eeee.at
www.iel1974.org
www.semper-fidelis-online.de
skoter.pro.mk
pioneer.famkos.net
oekumenitas.de/forum/
forum.financeconsult.de
www.preussenstadion.de
pff.preussenstadion.de
2.nct-online.de
sirag.comze.com/foro/
www.lighterclub.de/forum/
mojazona.dza.ba/icentar/
sg.bayernkicker.de
avponline.pytalhost.net/viscacha-081.install/
forum.space4u.de
www.micatuca.org
www.lena.macht-frei.de/bul/
rasocha.net
www.loxstedt.net
tubeload.tk
www.rdh-juh.de/Forum/
diehanseaten-hamburg.de/forum/
www.rasocha.de
www.schlafmuetze-forum.test.lc
www.futzichat.de/viscacha/
www.kardiotechnik.at/forum/
forum.interactive-systems.de
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="Viscacha (http://www.viscacha.org)" />' },

# Meta Copyright
{ :text=>'<link rel="copyright" href="http://www.viscacha.org" />', :certainty=>75 },

# Version detection # Powered by footer
{ :version=>/Powered by <strong><a[^>]+href="http:\/\/www\.viscacha\.org" target="_blank">Viscacha ([^<]+)<\/a>/ },

]

end


