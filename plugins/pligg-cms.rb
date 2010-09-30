##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pligg-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "Pligg is an open source CMS (Content Management System) that you can download and use for free. - homepage: http://www.pligg.com/"
examples %w|
1indianews.com
67.20.75.195
adsbookmarks.com
anybookmark.com
articlesdigg.com
android-store.com
blogiddy.com
webbuildingnews.net
scholarlinks.net
bestforvideo.com
blak-jak.com
blueprintarticle.com
digg.bkk.in.th
entreprise-marketing.com
exodusdigg.com
feedkr.com
formula1digger.com
huntsman08.com
ithemes.org
izeby.com
maseed.com
masterhubpage.com
nablr.com
newsmahal.com
news.polarmaru.org
pliggvote.com
pluggit.org
poststory.freenice.org
sabuyshopstore.com
tukdigg.com
tvbcentral.net
um.mu
www.5olio.com/home/
www.addalo.it
www.americansnoop.com
www.articwoof.com
www.asqit.com
www.astorefolder.com
www.bestpricesfvday.com
www.blogiddy.com
bookmarksubmission.com
www.burninginfo.com
www.celebwebnews.com
www.cheapstockmall.com
www.digb.org
www.diggdirect.com
www.digglnw.com
www.enlightenet.com
www.ensure.ws
www.ezdigg.com
www.find4get.com
www.forexnewshub.com
www.formula1digger.com
www.gimiq.com
www.imigg.net
www.imspike.com
www.indelve.com/index.php
www.internetshoppingsites.com
www.itrackthatsite.com
www.jacobsondigital.com/index.php
www.justzz.com
www.kowebb.com
www.mixxxxx.net
www.newsmahal.com
www.newwinecc.org
www.omoku.com
www.penang360.net
www.piedmontmission.org
www.pluggit.org
www.poststory.freenice.org
www.rhconseil.net
www.seofirmthailand.com
www.streetviewfunny.com
www.submitpligg.com
www.twendle.com
www.ujeed.com
www.wagill.com
www.waxxxed.com
www.webindex4u.com
www.we-indians.net
www.yasnw.com
|

matches [

# 144 results for "powered by Pligg CMS" @ 2010-11-07
# Powered by <a href="http://www.pligg.com/">Pligg CMS</a><br />
# Powered by <a href="http://www.pligg.com/">Pligg CMS</a> <br />
# Powered by: <a href="http://www.pligg.com" target="_blank">Pligg CMS</a>
# Powered By <a href="http://www.pligg.com/">Pligg</a>
{ :regexp=>/Powered [b|B]?y[:]? <a href="http:\/\/www.pligg.com[\/]*"[\ target="_blank"]*>Pligg[\ CMS]*<\/a>/ },

{ :text=>'href="http://www.pligg.com/">Powered By Pligg CMS</a> | ' },

]

end

