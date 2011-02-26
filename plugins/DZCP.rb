##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DZCP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "deV!L`z Clanportal - Homepage: http://www.dzcp.de"

# Google results as at 2011-02-27 #
# 419 for "2011 by deV!L`z Clanportal"

# Examples #
examples %w|
www.dzcp.de
demo.dzcp.de/news/
team.syox.eu/news/
www.nextclan.de/page/news/
www.team-inside.eu/gb/
blantix.comebuy.de/news/
ok2k.co.cc/news/
sas-sniper.com
gergaming.next-voice-hosting.de
www.schoenebeck-on-tour.de
vto.se-media-solutions.de/forum/index.php
www.pakt-der-woelfe.org/gb/index.php
www.myfragging.co.de/news/
www.excelsior-gaming.de
www.teamlaval-to.de/portal/gb/index.php
www.nightcrew.de.ki
www.tes-gaming.com
www.wtf-cup.de
www.e-noobs.eu/gametiger/
pinphone-resource.de.im/forum/
www.p4-gaming.com
www.gudddelaune.de
hq-clan.de/gb/
www.sunshinegaming.de/sunshine/clanwars/
www.execution-inc.de/forum/
wekserver.de/gb/
www.dynamix-esports.com/news/
www.mydefcon.de/gb/index.php
www.team-skill-deluxx.de/gb/
dpgaming.de/gb/
www.darkbrothers.de
www.fallenangelsgaming.com
minus.herobo.com/forum/
www.zoa-clan.com/gb/
www.veranstaltungstechnik-entec.com/movies/
www.deutsche-elite-garde.de/gb/
aerosol-esports.org/movies/
www.fsk-g4ming.de/forum/
www.xxleddyxx.de
www.bluejays-esport.de
fps-freaks.com/downloads/
www.prolox.de/forum/index.php
www.devil-hunter-multigaming.de/gb/
www.nemesis-project.de/gb/
www.oldschool-clan.com
87.118.95.218/clanpage/
vto-clan.eu/user/
www.thewatcher2010.de/dzcp/dzcp1.5.4/news/
|

# Matches #
matches [

# Default JavaScript
{ :regexp=>/<script language="javascript" type="text\/javascript" src="..\/inc\/_templates_\/[^\/]+\/_js\/dzcp.js"><\/script>/ },

# Copyright HTML Comment
{ :regexp=>/<!--\[ DZCP .{1} by Frank "deV!L" Herrmann - www.dzcp.de \]-->/ },

# Copyright HTML Comment
{ :regexp=>/<!--\[ DZCP .{1} by Frank "deV!L" Herrmann - www.dzcp.de & Patrick "Richy" Richert - www.my-starmedia.de\]-->/ },

]

end


