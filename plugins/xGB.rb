##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "xGB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "xGB guestbook - homepage: http://www.x-gfx.de/"

# 126 results for allinurl:"xGb.php" @ 2010-08-14
examples %w|
www.oranienschule-abi95.de/xGB_20/xGB.php
www.mosaik-projekt.de/xGB_2_1/xGB.php
www.milestoneband.de/gb/xGB.php
tus-levern.de/gaesteb/xGB.php
www.getraenke-wiesmann.de/gb/xGB.php
www.richenel.nl/guestbook/xGB.php
ozonlamper.dk/guestbook/xGB.php
www.faustimmen.de/inc/xgb/xGB.php
www.pfadi-rheinfelden.ch/gaestebuch/xGB.php
www.wolfsfieber.com/xGB_20/xGB.php
www.jacwiez-gizycko.ovh.org/xgb/xGB.php
www.kkbz.de/gast/auf/xGB.php
www.bau-art-gmbh.de/guestbook/xGB.php
www.steffen-sobe.de/xGB_20/xGB.php
www.adlerseite.de/kondulenzbuch/xGB.php
www.tierschutz-romanshorn.ch/php/gaestebuch/xGB.php
www.steffen-sobe.de/xGB_20/xGB.php
porsvej3.1go.dk/gaestebog/xGB.php
www.spanienferien.li/guestbook/xGB.php
www.skywalker.ag/guestbook/xGB.php
www.kulant24.de/xGB.php
www.lsg67ostrau.de/guestbook/xgb.php
www.robi.at/gbook/xGB.php
members.multimania.co.uk/poets/diwan/includes/gu/xGB.php
www.cyberfunks.de/page/home/xGB_20/xGB.php
|

matches [

{ :text=>'	<title>xGB</title>' },
{ :text=>'<!-- start xGB dynamic content -->' },
{ :text=>"powered by <a href='http://www.x-gfx.de' target='blank' title='Script by x-gfx.de'>xGB" },

]

# Version detection using powered by footer text
def passive
        m=[]

        if @body =~ /<p align='center'><span id='copyright'>\[ powered by <a href='http:\/\/www.x-gfx.de' target='blank' title='Script by x-gfx.de'>xGB [\d\.]+<\/a>/
                version=@body.scan(/<p align='center'><span id='copyright'>\[ powered by <a href='http:\/\/www.x-gfx.de' target='blank' title='Script by x-gfx.de'>xGB ([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

