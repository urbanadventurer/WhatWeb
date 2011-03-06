##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Updated version detection
##
Plugin.define "Ultrastats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.2"
description "UltraStats is a php based gamelog parser for the famous Call of Duty franchise supporting Call of Duty, Call of Duty: United Office, Call of Duty2, Call of Duty 4: Modern Warfare and Call of Duty: World at War. In order to fully support UltraStats, you need a Apache or IIS Webserver with PHP5 ( PHP4 should still work ) installed. You also need a MySQL Database to store the data into. - homepage: http://www.ultrastats.org/"

# Google results as at 2010-08-22 #
# 50  for "powered by Ultrastats" intitle:Ultrastats
# 383 for intitle:"Ultrastats :: Home"

# Examples #
examples %w|
codwwdemo.ultrastats.org
cod2demo.ultrastats.org
cod4demo.ultrastats.org
badacid.gaming.multiplay.co.uk/cod2stats/index.php
badacid.gaming.multiplay.co.uk/coduostats/index.php
67.19.3.130/cod4_stats/index.php
www.canvasfalcons.com
www.btkstats.born-to-kill.com
www.klazyklan.com/Ultrastats/index.php
www.nadfserver.org/ultrastats/
sc-gaming.info/stats/
a2gaming.com/ultrastats/
www.paranoiapub.tk/index.php
elderwarriors.com/UltraStats/cod4/
clanwta.com/stats/index.php
www.fssfclan.com/uswaw1/
highstop.com/ultrastats/src/index.php
www.stonedcoldkillers.com/ultrastats/src/index.php
www.biogamers.co.uk/us/
mostlynoobs.info/ultrastats/
codwawstats.xtra-gamers.com
clan-h2k.com/cod4_stats/
playbywire.servegame.org/cod4/
www.akboon.com/ultrastats/src/
www.clan-g13.com/ultrastats/
1dbstats.co.cc/src/
91.192.210.84/ultrastats/
kannikalat.net
www.superclan.com.au/cod4_stats/
bestmateclan.com
www.cutrwow.fr/ultrastats/src/
www.md-team.it/ultrastats_private/
www.bdkclan.com/ultra/
stats.gamingau.net/cod5/
www.thesoldiersyndicate.com/Ultrastats/
daddys-clan.org
www.sodx.de/stats/
ctc-ultrastats.com/index.php
www.dogsofbattle.com/UltraStats/COD/
www.snowmanland.org/cod4/ultrastats/snowmanland/index.php
www.hr1.game-host.org/ultrastats/
www.thephoenixcorps.com/index.php
www.40-1.net/ultrastats/index.php
www.frag-tastic.co.uk/forums/Stats/
www.punkposse.com/ultrastats/
www.aliensface.info
www.bpc4life.com/ultrastats/index.php
www.spidyweb.nl/ultrastats/mw/
cod2stats.true-gamers.nl/index.php
www.nutzak.com/ustat/index.php
www.tflclan.com/ultrastats/
www.tya-clan.com/stats11/index.php
kagclan.co.uk/ultrastats/index.php
www.disbanded-brothers.net/Ultrastats/src/index.php
www.damag3inc.org/ultrastats/
ultrastats.suljettu.com
506clan.auselite.com/ultrastats/index.php
ts.tdgv.org/statscod4/
cod4.carnageclan.de/ultrastats/index.php
uostats.comli.com/index.php
wff.frag247.co.uk/
cod4.zlofenix.org/index.php
88.159.209.175/stats/
www.teamadv.com.ar/ultrastats.php
cod4.impulsive.hu:28960/stat/
progames.interzet.ru/cod4/index.php
clanpnk.000hosted.com/ultrastats/index.php
www.datinglife.org/btkstats/index.php
www.cyber.ge/cod/stats/
potw.webcommand.org/cod2stats/index.php
bloodymayhem.net/stats/
stats.fearjunkies.com/index.php
www.opuclan.com/stats/index.php
game-net.ru
crossfirepolska.ayz.pl/src/index.php
84.245.189.215
bf2.pgnet.ru/stats/index.php
www.dogsukclan.co.uk/stats/cod4/
www.bba-clan.co.uk/statscod4/index.php
games.gnet.tn/cod4/
www.dhc-ultrastats.de/
www.aggravated-assault.us/UltraStats/index.php
www.camilovi-heroes.com/CODOS/
cod4.idknet.com/stats/
www.cod4ever.3clan.co.uk/ultrastats/index.php
www.european-clan-fighters.de/ultrastats0_3_16/coduo/index.php
www.drrclan.com/ultrastats/index.php
www.luckshot-ultrastats-cod4.12n.de/index.php
hitandrunstats.obinet.hu/index.php
www.mataymuere.com/stats_mym_cod2/index.php
www.twggaming.com/ultrastats/
kgs.cz/ultrastats/
www.bmhq.net/src/
nestandart-ns-1.spb.ru/stats/index.php
steel-server.com/ultra/index.php
www.gwservicesonline.com/121ultrastats/index.php
www.clan-cya.com/ultrastats/index.php
www.stormerclan.com/UltrastatsCod4/
clanraw.dk/cod4_stats/index.php
web158.confixx.homepage-hoster.de/ultrastats/index.php
t-birds-squad.com/ultrastats2/index.php
portal.cns-clan.de/GZN/index.php
gameworld.dascazino.de/cod2stats/
www.hullukala.com/dob/stats/
www.3pohq.de/ultrastats/src/
www.therdclan.com/rdstats/
www.gamingfriesland.nl/misc/ultrastats/cod5/index.php
ci5-clan.com/ultrastats/index.php
ultrastats.cods.pl/index.php
www.alexandriya.net/cod4stat/index.php
lan.kampfdrecksau.de/stats/index.php
dbdclan.co.uk/ultrastats/src/index.php
www.empireofcapor.ch/index.php
users.atw.hu/elmehardcore/src/index.php
www.ppcteam.com.br/stats/index.php
www.deltastars.pl/staty/index.php
www.nyta.ch/ultrastats4/index.php
ultrastats.elderwarriors.com/cod4/
www.theperfectgeneral.com/ultrastats2/index.php
cod.inx-gaming.co.uk/stats/index.php
www.callofduty.com.pl/staty/
www.levec.net/~cod4/index.php
www.unknownsoldiers.org.uk/src/index.php
ultrastats.1.vg/src/index.php
www.kodes.hu/stat_cod2/index.php
www.stormtroopers-clan.com/ultrastatsww/index.php
www.mroaclan.com/stats/index.php
www.thedadsarmy.net/ultrastats2/
crossfirepolska.ayz.pl/src/index.php
cod4.impulsive.hu:28960/stat/index.php
stats.teamsoe.com/index.php
pubplayinkillas.clanservers.com/codwawstats/index.php
87.118.116.21/ultrastats/index.php
codwwstats.true-gamers.nl/index.php
saratov.j-zone.ru/cod2/
orenburg.j-zone.ru/cod4/
cod4stats.true-gamers.nl/index.php
callofdutyxpert.com/pamstats/index.php
cod4.theparadox.de/index.php
www.45thinfantry.com/ultrastats/index.php
www.dcjc.cz/cod2/index.php
www.beak1.de/Stats/
www.gtc-clan.eu/ultrastats/ultrastats_cod4/src/index.php
www.sullivans.nl/ultrastat/index.php
www.lennatinlaitos.net/cod2/stats/
www.aggravated-assault.us/paintballstats/index.php
www.cod2box.de
www.codwar.pl/stats/cod2/index.php
www.mercenarios.com.es/statscod4/index.php
ul.j-zone.ru/cod2/
www.ttc-dorla.de/nightmode/ultrastats/
|

# Matches #
matches [

# Powered by text
{ :text=>'<DIV align=center>Powered by Ultrastats' },

# Default logo HTML
{ :text=>'<img src="./images/main/ultrastatslogo.png" width="300" height="200" name="ultrastats_logo" align="center">' },

# Default title
{ :regexp=>/<title>Ultrastats :: [^<]+<\/title>/i },

# Error page
{ :text=>'<title>UltraStats :: Critical Error occured</title>' },

# Version Detection
{ :version=>/ &nbsp;<a href="http:\/\/www.ultrastats.org[\/]?" target="_blank">Ultrastats<\/a> Version ([\d\.]+)/i },

]

end

