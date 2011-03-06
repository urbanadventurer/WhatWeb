##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "vbPortal" do
author "Brendan Coles <bcoles@gmail.com>"
version "0.2"
description "Portal and CMS for vBulletin - homepage: http://www.vbportal.com/"

# Google results as for 2010-08-27 #
# 154 for "Portal By vbPortal Version "

# Examples #
examples %w|
horrordvds.com
bytephoto.com
beta.renderotica.com/fora/
icmag.com
planetdragonball.net
grunwalds.com
unrealtournament.villageidiot.net
sharedportal.info
horrordigital.com
v2-forum.com/viewarticle.php
welderzone.com
www.cnczone.com
www.limpkinw.com
www.caddis.co.uk
www.satsupport.net/portal/
www.peugeot-gti.net/forums/
www.smgvbest.com/photopost/
www.hipforums.com/modules/News/
www.steppinoutnewmexico.com/
www.vizdepot.com/forums/
www.global-voices.info
www.scrapbookjunction.com/forums/
www.rapworlds.com
www.starwarsepics.com
www.amgforums.com
www.turborides.com
www.dslrexchange.com
www.abfnet.com
www.bitbendertest.com
www.bitbenderforums.com
www.kitten.com.my
www.firewallforums.com
www.iaap.co.uk/forum/
www.venturerider.org
www.worldspankingforum.com
www.world-spanking-forum.net/forums/
www.world-spanking-forum.com/forums/
www.delikan.net
www.db-forum.de
www.bghelp.net
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="vbPortal - Copyright 2010" />' },

# HTML Comment
{ :text=>'	<!-- Do not remove  or your scheduled tasks will cease to function -->' },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="vbPortal ([\d\.]+)" \/>/ },

# Version Detection # Portal by text
{ :version=>/Portal By vbPortal Version ([\d\.]+)<br \/>/ },

]

end

