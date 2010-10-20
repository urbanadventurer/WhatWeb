##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and ghdb matches
##
Plugin.define "CMScontrol" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.2"
description "CMScontrol - homepage: http://www.cmscontrol.com/"

# 79 results for +CMScontrol -"SQL Injection" -exploit +inurl:"index.php?id_menu=" @ 2010-06-15
examples %w|
www.cmscontrol.com
www.galsi.it
www.immobiliarelorenzi.it
www.makemebeauty.it
www.cookingexpo.it
www.rcmitalia.com
www.unopertutti.com
www.cilenti.at
www.promoberg.it
www.fiamsport.net
www.alta-quota.it
www.fieraedile.it
www.bergamocreattiva.it
www.bergamofiera.it
www.legiraffe.it
www.caniledicaluso.it/index.php
www.campionaria-bergamo.it
www.fieradelmobile-bergamo.it
www.gervaweb.com
www.bedandbreakfast-italia.info
62.173.166.171/_cms_demo2
www.studiodartefioretti.it
|

matches [

# 79 results for +CMScontrol -"SQL Injection" -exploit +inurl:"index.php?id_menu=" @ 2010-06-15
{ :ghdb=>'+CMScontrol inurl:"index.php?id_menu="', :certainty=>25 },

# Default meta generator
{ :regexp=>/<META name=[\"\']*generator[\"\']* content=[\"\']*CMScontrol eContent[\"\']*>/i
},

# Default meta formatter
{ :regexp=>/<META name=[\"\']*formatter[\"\']* content=[\"\']*CMScontrol eContent[\"\']*>/i },

# Default meta abstract
{ :regexp=>/<META name=[\"\']*abstract[\"\']* content=[\"\']*CMScontrol[\"\']*>/i },

# Default javascript in old versions
{ :text=>'document.write("<ME"+"TA ht"+"tp-eq"+"uiv=\"REF"+"RESH\" con"+"tent=\"1.00; u"+"rl="+"index"+"."+"ph"+"p\">");' },

# Default meta generator # 3.x
{ :regexp=>/<META NAME=[\"\']*generator[\"\']* CONTENT=[\"\']*CMScontrol rel 3.x[\"\']*>/i, :version=>'3.x' },

]

end

# It should be possible to guess the version depending on the copyright dates:
# <META name="copyright" content="Copyright 2000-2006 CMScontrol-GervaWeb">
# <META NAME='copyright' CONTENT='Copyright © Gerva Srl'>

