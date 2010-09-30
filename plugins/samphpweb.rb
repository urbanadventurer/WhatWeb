##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "samPHPweb" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.1"
description "samPHPweb is a web feature that is included with the installation of SAM Broadcaster. It allows you to run a PHP driven site from your web host that communicates with your SAM Database. - homepage: http://www.spacialaudio.com/?page=sam-broadcaster&tab=tab-sam-broadcaster-overview"
examples %w|
mattersofmusic.com/954
www.babesociety.dk/playlist.php
www.theorangeradio.com
sam.eve-radio.com
www.stealth.musicvaultradio.com
www.troika-web.com
corelinkradio.com/playlist/
www.zavoyradio.com
www.southernfriedsounds.com/samHTMweb/
www.radiodjscott.co.uk/samHTMweb/
astyria.thaitavern.com
www.dukii.com/shoutcast/
listen.scrambledorfriedradio.net/playlist.php
elfradio.bwworld.ru
www.dwdc.net/samz/
request.keeskoster.com
taxigirl.gamingradio.net/playlist/
interactive.star1045.net.au
www.limbikfreq.com/samweb/
www.stallionradionetwork.com/stallion1/
www.tobeactive.com/radio/
|

matches [

# 334 results @ 2010-06-29
{:certainty=>75,:ghdb=>'"This page was produced using SAM Broadcaster" "Copyright Spacial Audio Solutions"'},

# loading page
{:certainty=>75,:text=>'<meta HTTP-EQUIV="REFRESH" CONTENT="0;url=playing.html">'},

# powered by links
{:text=>'<a href="http://www.spacialaudio.com/products/sambroadcaster/" target="_blank"><img src="images/sam-bc.gif" border="0" alt="Powered by SAM Broadcaster" width="120" height="60" />'},

{:text=>'<a href="http://www.spacialaudio.com/products/sambroadcaster/" target="_blank"><img src="images/sam-bc.gif" width="120" height="60" border="0" alt="Powered by SAM Broadcaster">'},

{:text=>'This page was produced using <a target="_blank" href="http://www.spacialaudio.com/products/sambroadcaster/">SAM Broadcaster</a>. © Copyright <a target="_blank" href="http://www.spacialaudio.com">Spacial Audio Solutions, LLC</a>'},

# default javascript
{:text=>' songwin = window.open("songinfo.php?songid="+songid, "songinfowin", "location=no,status=no,menubar=no,scrollbars=yes,resizeable=yes,height=400,width=650");'},

]

end

