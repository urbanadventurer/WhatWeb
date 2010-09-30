##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webmatic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-29
version "0.1"
description "CMS - homepage: http://www.webmatic.it/it/"

# 173 results for "powered by Webmatic" @ 2010-08-29
examples %w|
urldomini.altervista.org
europacarsrl.com
informaticipiazza.it/www/index.php
fiam-j.com/index.php
www.alessandroscorzoni.it
www.aliverde.it
www.cofari.it
www.armoniaderbe.it
www.roca-oilandgas.com
www.amareravenna.it
www.arciravenna.it
www.arcahotels.com
www.ormeggira.it
www.rosarioweb.it
www.surfviaggi.it
www.barciaristorazione.it
www.gamaravenna.com
www.mctautonoleggio.com
www.lagiraffa.net
www.centroesteticosolidea.it
www.ligonchiovacanze.it
www.dado.ra.it
www.osteriadeibattibecchi.it
www.faustorivola.it
www.studiocirilli.eu
www.molinoboschi.com
www.francescogiangrandi.it
www.helabora.it
www.fichicaramellati.com
www.musicandvideo.it
www.boschiservizi.it
www.antincendiosicurezza.it
www.circoloravennate.it
www.contoworld.it
www.metanobologna.it
www.publifest-ra.it
www.verandadellerose.it
scardinorappresentanze.com
www.kmm.matrik.edu.my/index.php
www.matrik.net/kmm/index.php
www.sinistragiovanile.ra.it/index.php
www.edizioniessegi.it
www.valliepinete.com
www.ipssartcingoli.it/index.php
www.europacarsrl.com
www.easus.eu/index.php
www.rtarm.it
www.aretevalguarnera.com/index.php
www.mutuafutura.it
www.zweirad-lampe.de/catalog/default.php
www.viagginelloscrigno.com/index.php
www.argnaniandrea.com/index.php
www.esotechnics-heerlen.com
www.ravennanotizie.it/info/pezzoli/
www.kmm.matrik.net/index.php
|

matches [

# Powered by text
{ :text=>'Powered&nbsp;by&nbsp;<a href="http://www.webmatic.it">Webmatic</a>' },

]

# Version detection powered by text
def passive
        m=[]

	# Version 2.8 and prior uses "TARGET" as opposed to "target"
        if @body =~ / href="http:\/\/www.valarsoft.com" [TARGET|target]+=[^>]+>Powered by: Webmatic ([\d\.\ a-zA-Z]+)<\/a>/
                version=@body.scan(/ href="http:\/\/www.valarsoft.com" [TARGET|target]+=[^>]+>Powered by: Webmatic ([\d\.\ a-zA-Z]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

