##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClanSphere" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Free OpenSource Clan CMS - homepage: www.csphere.eu/index/clansphere/about"

# 45 results for "powered by ClanSphere" @ 2010-09-18
examples %w|
demo.csphere.eu
acg.anicode.info
fifasquad.com
hl2serveradmintool.tontauben-clan.com
orden.begbie.ws
world-eaters.net
www.aeon-clan.de
www.hsh-berlin-clan.de/v3/
www.mt-lan.de
www.myp2b.eu
www.partymode-homepage.de.ki
www.schwarzer-orden.eu
www.schwarzer-orden.com
www.thecrazymonkeys.de
www.tontauben-clan.com
www.unity-esports.net
www.unity-esports.org
|

matches [

# Default title
{ :text=>'<title>ClanSphere - News</title>' },

# Meta generator
{ :text=>'<meta name="generator" content="ClanSphere" />' },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.csphere.eu[^>]+>Clansphere[\ CSP]*/i },
{ :regexp=>/<a href="[\/]*index.php\?mod=clansphere&amp;action=about[^>]+>Powered by Clansphere[\ CSP]*/i },
{ :regexp=>/<a href="[\/]*index.php\?mod=clansphere&amp;action=about[^>]+>Clansphere[\ CSP]*/i },
{ :regexp=>/powered by <a href="http:\/\/www.clansphere.net[^>]+>ClanSphere Project<\/a>/ },

]


end

