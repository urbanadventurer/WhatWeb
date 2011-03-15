##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BAB.Stats" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "BAB.Stats is a statistics system for the Delta Force series of games by Novalogic. - Homepage: http://www.babstats.com/progress.php"

# Google results as at 2011-03-16 #
# 137 for intitle:"Powered by BAB.Stats"
# 12 for "BAB.Stats is a statistics system for the Delta Force series of games by Novalogic" inurl:"index.php?action=about"

# Examples #
examples %w|
www.trailerparksquad.com/babstats/babstats5/index.php?action=player_stats&id=10663
www.skilledplayers.net/babstats/index.php
babstats.blacksunempire.net/Babstats_Xtreme/index.php?action=squad_stats
www.wydgaming.com/Neos_Chronos/
www.deltaforcegaming.com/Babstats_Xtreme/
etd-squad.net/Neos_Chronos/
juggalotroops.org/Neos_Chronos/
www.skilledplayers.net/babstats/
www.thesmurfs.net/Neos_Chronos/
www.isa-squad.eu/bhdstats/
www.trailerparksquad.com/babstats/babstats5/index.php?action=about&bms=
assaultsnipers.com/as_stats/
www.bjay12.com/Neos_Chronos/
www.gunssquad.com/stats/
www.fires-house.com/babstats5/
www.test.fires-house.com/Neos_Chronos/
www.snipersworld.net/Neos_Chronos/index.php?action=weapon_stats
babstats.blacksunempire.net/Babstats_Xtreme/index.php?action=squad_stats
www.elementx.org/stats/3/index.php?action=player_stats&id=1391
pbjbabstats.com
www.ao1-squad.net/Neos_Chronos/
98.129.220.106/Neos_Chronos/
www.tmwar.com/Neos_Chronos/
hellraiders.net/Neos_Chronos/
www.striker.dk/Babstats_xtreme/
www.dflrevolt.com/stats/
www.kr3w-squad.net/Neos_Chronos/
www.bs-squad.be/Neos_Chronos/
www.tfdesp.com/babstats4/
stats.nicelittlemaps.nl/Neos_Chronos/
painsplaypen.com/babstats/
gvcchile.byethost4.com/Neos_Chronos/
des-squad.net/babstats5/
www.realsnipers.com/stats/monthlystats/
themetesters.com/babstats/Babstats_Xtreme/
brigadafuzileirosbrasil.com.br/Neos_Chronos/
www.euro-stats.com/Neos_Chronos/
www.hairtriggertroops.com/Neos_Chronos/
cyn8.kicks-ass.net/BHD1/
stats.elitesmurfkillers.com/Neos_Chronos/
www.dutch-revolution.nl/Neos_Chronos/
www.kr3w-squad.info/Neos_Chronos/monthlystats/
www.hardmaps.net/website/stats/
eks.dfga.net/babstats5/
shooteraod.dyndns.org/babstats/
ojdk.dk/chronos/
www.teamost.com/statistics/
www.soldiersinaction.nl/Neos_Chronos/
www.power-of-sniper.de/Neos_Chronos/
www.war-at-south.de/stats/
|

# Matches #
matches [

# Meta Author
{ :text=>'<meta NAME="Author" CONTENT="Bab.Stats Team">' },

# Title
{ :certainty=>25, :regexp=>/<title>[^:]+ :: [^:]+ :: Powered by BAB.stats<\/title>/ },

# Version Detection
{ :version=>/Powered by BAB.Stats :: <a href="index.php\?action=about&bms=" onmouseover="doTooltip\(event, 'About BaB.Stats'\)" onmouseout="hideTip\(\)">BabStats v([\d\.]+)<\/a>/ },

# Version Detection
{ :version=>/Powered by <a href="index.php\?action=about&bms=">BAB.stats<\/a> version ([\d\.]+)/ },

# Chronos # Meta Author
{ :text=>'<meta NAME="Author" CONTENT="Tomas Stucinskas a.k.a Baboon">', :string=>"Chronos" },

# Chronos # Title
{ :text=>' - Powered by BAB.stats Chronos</title>', :string=>"Chronos" },

# Chronos # HTML Comment
{ :text=>'<!-- AUTHOR : Tomas Stucinskas a.k.a Baboon -->', :string=>"Chronos" },

# Chronos # Version Detection # Powered by link
{ :version=>/Powered by Bab.stats ::[\r\n\s]*<a[^>]+href="(http:\/\/www.babstats.com\/|\/Neos_Chronos\/index.php\?action=about)">Neos.Chronos<\/a> ::[\s\r\n]*Version ([^\(]+) \(Standalone\)/, :offset=>1, :string=>"Chronos" },

]

end


