##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "easyLink-Web-Solutions" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.2"
description "homepage: http://www.mountaingrafix.at/"

# Google rsults as at 2010-09-03 #
# 308 for "powered by easyLink"

# Examples #
examples %w|
7zwerge.org
anwalt24.name
bestfirma.com
grenzenlos.lustgarten.de
webindex4u.de
www.presserabatte.com/index.php
www.bestelinks.com/index.php
www.refer.de
www.brickweb.de
www.top-weblist.at
www.apothekenseiten.de
www.reichenbuch.de
www.maxxxlinks.com
www.navi-webkatalog.de
www.sailing-yachting.de
www.gratis-link.at
www.dock1-linkverzeichnis.com
www.linkliste24.de
www.kaiserstuhl.info
www.arawan.de
www.pc-monteur.de
www.kampfsport-in-hannover.de
www.finanzen-investment-beratung.de
www.pcverzeichnis.de
www.mmog-portal.com
www.sex-finden.org
www.1-webkatalog.com
www.findsolar.de
www.freelancer4seo.de
www.heilpraktiker-verzeichnis.eu
www.websitekatalog24.de
www.oshop-search.de
www.mein-webkatalog.net
www.kasi69.de
www.bigarni.net
www.pr-webkatalog.com
www.berlinerportal.com
www.dominaguide.eu
www.geocaching-portal.com
www.alle-unternehmen.com
www.domina-guide.net
www.webverzeichnis.davartis.de
www.tldi.org
www.geld-verdienen-fp.de
www.branchen24.net
www.zuechterverzeichnis.info
www.zagreb-info.com
www.hrvatibh.com
www.golferlink.de
www.mittelstandsratgeber.de
www.florida-links.de
www.viwc.net
www.wir-in-neukoelln.de
|

# Matches #
matches [

# HTML Comment # This may be removed only with permission of the developer
{ :text=>'Dieser Abschnitt darf nur mit Genehmigung des Entwicklers entfernt werden und bedarf einer' },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="easyLink v([\d\.]+)" \/>/ },

# Version Detection # Powered by text
{ :version=>/[P|p]?owered by easyLink v([\d\.]+)/ },

]

end

