##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kontaktformular" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-13
version "0.1"
description "PHP contact form - homepage: http://www.radbekleidung.eu/gratis-kontaktformular.html"

# 49 results for "Script Powered by Kontaktformular" @ 2010-09-13
examples %w|
aerobic-stabilized-oxygen.de/Ordner/kontakt.php
bootsschulung.de/anmelden/anmelden/anmelden.php
eg.sbb-design.de/?sec=contact
ertek.de/kontakt.php
hk-entertainment.com/index.php?seite=kontakt
jurkovic.de/kontaktformular.php
oxygen-bar.de/jobs.php
stefanfreese.de/kontaktformular/kontakt.php
taurus-trading.de/kontaktformular/kontakt.php
ulmen-apotheke-nierstein.com/templates/kontakt.php
wogramm.de/kontakt.php
www.ab-fahrt.eu/kontaktform/kontakt.php
www.astrobiographie.ch/kontakt/kontakt.php
www.australien-fox-downunder.de/kontaktformular/kontakt.php
www.bestattungen-kramer.de/kontakt.php
www.fanstars.de/kontakt/kontakt.php
www.floh-dur.de/wenigasche/kontakt/02/kontakt.php
www.hausamdorfteich.de/kontakt.php
www.henkelstreich-internisten.de/kontaktformular/kontakt.php
www.kanal-werner.de/?content_text=12
www.licht-wohnen.de/kontaktformular/kontakt.php
www.orchidmassage.de/kontakt/kontakt.php
www.rbplanung.ch/contact/kontakt.php
www.stopp-wohnnotstand.ch/kontakt.php
www.polyperla.de/templates/kontakt.php
www.d-minds.de/wh/kontakt.php
www.franziskagrab.ch/kontakt/kontakt.php
www.mikrasysteme.de/kontakt/kontakt.php
www.nshop2000.de/kontakt.php
www.boersenpoint.de/index.php?site=kontakt
www.evelinfraentzel.de/php/kontakt.php
www.waldhundeschule.de/kontakt.php
www.labor-auf-raedern.de/Kontaktformular/kontakt.php
www.wolfsonium.com/kontakt/kontakt.php
www.reeckmann.de/mailform/kontakt.php
www.notrucksack.com/kontakt.php
www.zimmerer-innung-ulm.de/zimmerer-innung-ulm/inhalt/kontakt/kontakt.php
www.kneipe-longjohnsilver-berlin.de/kontaktformular.php
www.handkaffeemuehlen.de/php/kontakt.php
www.groner-kriegsknappen.de/include/kontakt.php
www.rebleuten.ch/kontakt.php
www.steuernpoint.de/index.php?site=kontakt
www.rehsec.de/kontakt.php
|

matches [

# HTML comment
{ :text=>'<!--Copyright darf NICHT entfernt werden!!-->' },
{ :text=>'<!-- Hinweis darf nicht entfernt werden! -->' },

# Powered by text
{ :text=>'Script Powered by <a target="_blank" href="http://www.radbekleidung.eu/gratis-kontaktformular.html">Kontaktformular</a>' },
{ :text=>'&copy; Script Powered by kontaktformular.org </span>' },

]

end

