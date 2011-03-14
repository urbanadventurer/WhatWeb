##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MKPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "MKPortal blog and forum software - Homepage [offline] : http://www.mkportal.it/"

# Google results as at 2011-03-05 #
# 307 for inurl:"index.php?ind=blog"

# Examples #
examples %w|
www.abadan.net
www.lambretta.org
www.santanu.in/index.php?ind=blog
thieves-guild.net
unfilterednewsnetwork.com
www.isetegija.net
www.biolifestyle.org/en/
www.mymopar.com
www.nyakerz.org
trophs.com
www.smportal.net/foro/
www.russianwomendiscussion.com
www.jappop.com
northeastatvers.com
pikachusparadise.com
www.batticuore.it
dosomefink.com
www.scrivere.info/community/
www.smiliegenerator.us
www.acuariofiliacanaria.com
mondialskins.com
www.chess-camper.it
www.configurandoequipos.com
www.hcmsoft.com.mx
www.cbsmwired.org
rsftemplars.com
lakemalawi.co.uk
www.l2ro.com
www.tacopscheats.com
www.radio-talk.net
cichlidkeeping.com
www.siflige.com
games.nakhonthai.net
realrogueclan.com
www.reteperugia.com/public/
www.twin-sabers.com
www.reign-guild.org
maku-racing.com
www.fantasyshark.net
www.online-dating-rights.com
www.tradtalk.com
www.aquazone.gr
underworld.tomsk.ru
x-factorsite.com
mprcracing.com
wvsportsman.net
www.uk-corp.co.uk
hookonhl.com
africancichlidforum.com
geotruckers.com
gaz-band.ru
www.chiamaroma.it
nasdev.com
www.wowcoh.com
wolfbrigade.guildregister.com
owl.pp.ru
portal.mypjr.com
www.guitarristas.org
www.tocm.org
ashleyrenee.us
fragnode.com
emeraldforesthomeowners.com
www.rockfamily.it/public/
www.chatmania.it
viewmix.zenith-sp.net
1001beauty.co.cc
theanimefights.net
www.seriesyestrenos.com
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="MKPortal" />' },

# CSS Comment
{ :text=>'|   Cascading Style Sheet for MKportal "Forum" Portal Template' },

# HTML Comment
{ :certainty=>25, :text=>'<!-- end close portal body -->' },

# Version Detection # Copyright link
{ :version=>/<a style="text-decoration: none;" href="http:\/\/www.mkportal.it\/" target="_blank">MKPortal<\/a> ([^&^<]+)(<\/b>)? &copy;2003-20[\d]{2}/ },

]

end


