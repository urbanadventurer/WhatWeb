##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Updated version detection
##
Plugin.define "E-Xoopport" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "CMS - homepage: http://www.e-xoopport.it/modules/news/"

# Google results as at 2010-09-18 #
# 159 for "powered by E-Xoopport"

# Examples #
examples %w|
www.e-xoopport.it/modules/news/
courages.awardspace.info/modules/news/index.php
news.destinysphere.ru/modules/ds_news/
realityhouse.altervista.org/modules/news/
amicididario.com
school246.spb.ru
learn.e-xoopport.it/index.php
school246.spb.ru/modules/news/
www.andreaferigo.it
www.midimusic.it
www.cetp.org
www.dance70.com/modules/news/
www.dschola.it/modules/europa_news/
www.vignalonga.it/modules/news/
www.podomedic.it/modules/news/
www.circolodidatticosorrento.it
www.grilliverona.it/modules/forum/index.php
www.assport.org
www.arconline.it
www.paxvobis.it/modules/news/
www.boxethai.it
www.graficapastorale.it/modules/sections/
www.concattedralesegni.it
www.fimt.it/modules/ImageDirectory/
www.motoinsesto.it/modules/partners/
www.corogiovaniledisegni.it
www.focolaccia.org
www.cadutacapelli.it
www.athlonroma.it
www.egis.it
www.psicologiadellareligione.it/sipr/modules/mydownloads/
www.castelliromanijolly.it/blog/modules/news/
www.egaleoni.com/modules/news/
www.cavalleriaitaliana.it/modules/news/
www.theshot.it/exp/modules/contents/
www.torino9.it
www.floradisardegna.it/floradisardegna/modules/news/
www.quellidiviacopernico1976.it
www.dschola.it/modules/opensource_sections/
www.torino9.it/modules/news/
www.websmasher.altervista.org/portal/modules/mydownloads/
www.immagicaweb.com/delazzari.com/modules/catalogo/
www.lcimmagine.it/samsara/modules/news/
|

# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<div align='center'>Powered by E-Xoopport ([^&]+)&copy; 2004[\-0-9]{0,5} <a href='http:\/\/www.e-xoopport.it\/' target='_blank'>The E-Xoopport Project<\/a><\/div>/ },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="E-Xoopport ([^"]+)">/ },

]

end

