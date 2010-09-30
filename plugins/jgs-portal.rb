##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "JGS-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-26
version "0.1"
description "CMS - homepage: http://www.jgs-xa.de"
examples %w|
www.net-city.eu
icemans-spielbude.de/wbb2/jgs_portal.php
vonwiegen.net
www.team-sh.de
www.bdsm-aktuell.de/jgs_portal_links.php
www.unsereherren.de
www.brunswickforum.de
www.diehp.com/cms-en/
www.pflegeeltern.de
www.tv-junk.com/wbb2/
www.senfbrot.info
www.premiere-angels.com/wbb2/
www.wuerfelkater.de
www.liddll.info
www.thegreatconflict.de/jgs_portal_box.php
www.l4dforum.de
www.koosaiguild.com
www.mihas.net
simspalast.de
servercom.de
www.allianceofdarkness.de/forum/jgs_portal_box.php
www.rcaustria.at/onearena/jgs_portal.php
www.die-garde-von-azeroth.de/jgs_portal.php
www.traumkinderland.de
www.natural-born-thrillers.de/xforum/jgs_portal.php
www.perlepnica.ch
www.bf2-inside.de
www.das-schoenheitsportal.de
opel-team-hamburg.com
www.nanoriff.info/jgs_portal.php
www.hamasaki.asia
www.wolfchaoten.de
www.rubensportal.net
jadda.net
www.seventy-nine.eu
www.familyair.de
www.bt-radio.de
cofo.biz
www4.wetterspiegel.de/stormchaser/wbb2e/jgs_portal.php
www.team-arc.de/forum/jgs_portal.php
www.dj-druckmaster.de
africanfish.aquaristiknet.de
www.gayliveradio.de
www.nissanboard.de/jgs_portal.php
www.myronin.de
hunde-familie.net
www.age-community.net/forum/
www.4mybaby.at
www.blackpott.de
www.multimedia-streaming.de/jgs_portal.php
pedar309.bplaced.net/jamaican/
www.europa-liga.com
www.woodlandforum.com
www.freeocen.de
www.countycottage.de/jgs_portal.php
www.honda-boldor-board.de/forum/
www.silgrad.com/wbb2/jgs_portal.php
www.evo-forum.de
wentworthmiller.de
www.corvetteforum.de
www.kayjoa.de/toffigunz/jgs_portal.php
www.subi-evo-treff.com
www.clanbl.de
board.oceanfight.co.uk
www.akisima.de
www.tierboard.org/board/jgs_portal.php
www.airattack-central.com/
www.acctrade.org/jgs_portal.php
www.simmaxia.net
jamaican-clan.com
www.phantasybar.com
|

matches [

# About 4,580,000 results @ 2010-06-26
{:name=>'GHDB: "Powered by JGS-Portal Version"',
:certainty=>75,
:ghdb=>'"Powered by JGS-Portal Version"'
},

]

# Powered by <b>JGS-Portal Version 3.0.0</b> &copy; 2002-2005 <b><a href="http://www.tierboard.org" >www.jgs-xa.de</a></b></span></td>
# Powered by <b>JGS-Portal Version 3.1.0</b> &copy; 2002-2005 <b><a href="http://www.jgs-xa.de" target="_blank">www.jgs-xa.de</a></b></span></td>
def passive
        m=[]

        if @body =~ /Powered by <b>JGS-Portal Version [\d\.]+<\/b> &copy; /
                version=@body.scan(/Powered by <b>JGS-Portal Version ([\d\.]+)<\/b> &copy; /)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m

end


end

