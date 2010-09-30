##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :name & :certainty

Plugin.define "ModxCMS" do
author "Andrew Horton"
version "0.2"
description "OpenSource CMS written in PHP. Homepage: http://modxcms.com/"

examples %w|
http://www.lanni.jp/
http://www.ksk26.co.jp/
http://www.broadwaysanjose.com/
http://www.pictwo.com/
http://www.baby-cakes-cupcakes.com/
http://www.g73.de/
http://agarciaarquitectos.pt/
http://www.franconique.nl/
http://www.michael-van-laar.de/
http://www.logiagamer.com/juegos/
http://wanchairotary.org/
http://teplocel.ru/
http://www.feedfabrik.com/
http://www.filieo.com/
http://dvcompany.biz/
http://www.creationtruth.org/
http://kinerase.com.tw/
http://investsouth.ru/
http://www.hutag.de/
http://www.2dz.pt/
http://3dreactor.com/
http://atsrostov.ru/
http://www.cis.org.uk/
http://www.ibh-solar.de/
http://www.weltklassezuerich.ch/
http://www.rotoplas.com/
http://www.dragolab.com/
http://www.polam-rem.com.pl/
http://www.mipeta.fi/
http://www.baikal-web.ru/
http://www.deactro.nl/
http://auto-life.kiev.ua/
http://www.le-souffle-du-pic.fr/
http://www.cinema-leprado.com/
http://www.habitatvegetal.com/
http://www.morethanadriveway.org/index.php
http://www.soteapparel.com/
http://www.p-jentschura.com/
http://www.energycrew.ca/
http://www.indieophile.com/
http://www.drreinke.de/
http://www.christophe-peyras.com/
http://www.blohmcreative.com/
http://www.botflyrocks.com/
http://www.techsolcom.ca/en/
http://festival.hevy.co.uk/
http://www.rockness.co.uk/
http://www.interparking.nl/
http://www.dakfilms.org/
http://www.panamaspain.com/
http://www.deerwalk.com/
http://www.rspca.org.au/
http://www.blueskyvineyards.com/
http://www.smarthistory.org/
http://www.en-taipei.com.tw/
| 

# none of this is common
#www.soteapparel.com-.html:        <script type="text/javascript">var MODX_MEDIA_PATH = "media";</script>
#www.techsolcom.ca-en-.html: <meta name="version" content="MODx 0.9.6.2-rc1 (rev 3741)" />
#www.indieophile.com-.html:<li>powered by <a href="http://www.modxcms.com" title="modx cms">mod<strong>x</strong></a></li>
#www.filieo.com-.html:	<meta name="generator" content="ModX" />


matches [
{:text=>'<meta name="generator" content="ModX'},
{:text=>'<script type="text/javascript">var MODX_MEDIA_PATH'}
]

# these cookies and p3p are fairly reliable
# two diff lengths. version change?
#Set-Cookie: SN489f661741c15=33puk0t1j8rjeulorh70m73b52; path=/
#Set-Cookie: SN484d726774858=f0f40f14fbddeaead360a77ccb006365; path=/
# P3P: CP="NOI NID ADMa OUR IND UNI COM NAV"


def passive
  m=[]
  m << {:name=>"SN4 Cookie", :certainty=>75 } if @meta["set-cookie"] =~ /^SN4[a-z0-9]{12}=/
  m << {:name=>"P3P" } if @meta["P3P"] =~ /CP="NOI NID ADMa OUR IND UNI COM NAV"/
  
  m
end

# /manager page contains :
#<a href="http://modxcms.com/" target="_blank">MODx CMF Team</a>

end

