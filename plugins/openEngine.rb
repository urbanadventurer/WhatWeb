##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "openEngine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-02
version "0.1"
description "openEngine - Content Management System (CMS) - Homepage: http://www.openengine.de/"

# ShodanHQ results as at 2011-10-02 #
# 71 for "CMS by openEngine"
# 47 for inurl:"cms/openengine" intitle:"openEngine"
# 26 for inurl:"admin=login" "Open Source Web Content Management System"
# 16 for inurl:"cms/website.php?id=" inurl:"admin=login"

# Dorks #
dorks [
'inurl:"cms/openengine" intitle:"openEngine"'
]

# Examples #
examples %w|
www.kuendig-baumanagement.ch/cms/openengine/
www.domaincatalog.biz/cms/openengine/index.php
www.medieva.de/cms/openengine/index.php
www.amvl.lu/cms/openengine/index.php
www.biomasseverband.it/cms/openengine/index.php
www.die-tischler.net/cms/openengine/
www.benda-lutz.com/cms/openengine/
www.casarustica.de/cms/openengine/?sid=c5iekbruqju3k00be2emcjegt3
www.zahnarzt-klagenfurt.info/ksvl/cms/openengine/
www.foerderverein-staufner-kinder.de/cms/openengine/?sid=8251f017dab7f03120a5d5a64c985e50
www.tc-ebnat.de/page/cms/website.php?id=/de/index.php&admin=login
www.volkersieben.de/cms/website.php?id=/index.htm&admin=login
www.komen.de/cms/website.php?id=/de/index.htm&admin=login
www.hotels.mantra-cube.de/cms/website.php?id=berdorf&admin=login
www.kirche-fuer-demokratie.de/cms/website.php?id=/de/wir.htm&admin=login
www.rockit-openair.ch/cms/website.php?id=/de/impressum.htm&admin=login
www.joneit-engineering.de/v2/cms/website.php?id=/de/joneit-engineering.html&admin=login
www.annetismer.de/cms/website.php?id=/de/index.htm&admin=login
www.hamburgspotters.net/cms/website.php?id=/index.htm&admin=login
www.volkersieben.de/cms/website.php?id=/index.htm&admin=login
www.bsts-berlin.de/cms/website.php?id=/de/index.htm&admin=login
www.velobuero.rohark.de/cms/website.php?id=/de/index.htm&admin=login
gestaltungdeszufalls.de/cms/website.php?id=/index.htm&admin=login
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- openEngine Comment START -->' },

# lt/lte IE7 confitional HTML Comment
{ :regexp=>/<!--\[if lte? IE 7\]>[\s]+<script src="system\/([^\/^>]+\/)*script\/IE7\/ie7-standard-p\.js" type="text\/javascript"><\/script>/ },

# Version Detection # Admin Page
{ :version=>/<p class="adminText" style="font-size:9px;">[\s]+openEngine ([^\s]+)( - [\d]+)? - Open Source Web Content Management System<br>/ },

# Logo HTML
{ :regexp=>/<a href="http:\/\/www\.openengine\.de" target="_blank"><img src="system\/([^\/^>]+\/)*\/img\/oes_logo\.png" alt="openEngine Homepage"><\/a><\/p>/ },

]

end

