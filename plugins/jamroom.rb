##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Jamroom" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.2"
description "Jamroom specializes in building web communities centered around media producers such as musicians, photographers, video enthusiasts and more - Jamroom gives you the capability to provide dozens of different services to your users. - homepage: http://www.jamroom.net/"

# Google results as at 2010-07-25 #
# 201 for "Powered by Jamroom"

# Examples #
examples %w|
demo.jamroom.net
alvandiweb.com/jams/
anandnarayan.org
arockymtnhigh.com
beatbreed.com
beatdepot.net/jamroom/
beatnova.com
besthighschoolband.com
bigrock.net
boxspin.com/brighton/
bunkrecords.com/jamroom/
burghhiphop.com
cash4urgirl.net/jamroom-4.0.8/jamroom-4.0.8/
darkwalker666.de/articles/video
dmvhits.com
farsitunes.com
flashback.jamroom.net
fvtb.co.cc
godsjamroom.com
hannon.ch/jam/
intiemusic.com
jamroom.elygen.com
jazzblvd.com
junglesafarimusic.com
kantkillrockandroll.com
lydparken.no
macidol.com/jamroom/
monkfunk.com
motherloverecords.com
music.2xtunes.com
musiccheckpoint.com
muzykownia.com.pl
mydesidj.com
mylevel5realty.com
mymusaic.com
mysticstreets.com
onedreamrecordingmusic.com
persiaband.com
platinumproducersamples.com
reformation-tracks.com
reggaedemo.com
seattleriff.com/sr/
sethhartmanmusic.com
silvermoondiscos.com/jamroom/
simkale.com
skooterandknuckles.com
sliderencontre.comoj.com
songwritersworkshop.org
sumurlagu.org
test.kylemsmith.net
thebeatagent.com
tholomyes.netne.net/jamroom/
tisztelettel.meghivlak.com
torquelondon.com
tparker.net/JamRoom/
tvs-online.info
hellasmusic.com
www.13south.com
www.amateurgonzo.com
www.besthighschoolband.com
www.blues-n-soul.com/sell-my-music/
www.canadianmusic.com
www.caribcollabo.com
www.cdmusica.com/jamroom/jamroom/
www.clubunderground-reno.com/jamroom/
www.coronacafe.co.za/jamroom/
www.digitalbeatmusic.net/jamroom/
www.dsplayerskins.com
www.emusicspace.com
www.felonioustrax.com:81
www.gaschamberrecords.com
www.gotchabitchez.com
www.gypsyyou.co.cc
www.indiereview.net
www.jamcouch.de
www.jungleleaders.com
www.kentuckyjams.com
www.lafire.net/jamroomtest1/
www.localbandz.com
www.lydparken.no
www.mainemusiciansexchange.org/jamroom/
www.michiganmonster.com
www.motherloverecords.com
www.mp3songs.org.uk/jamroom/
www.musicnoyz.com
www.musiek.info
www.mylevel5realty.com
www.mymix.com.br
www.nj-music.net
www.ocotg.com
www.omahahiphop.com/jamroom/
www.opranoradio.com
www.ozbands.com.au
www.panablu.com
www.paulasher.com
www.podsafeaudio.com
www.sevenorchids.com/site/
www.silvermoonproductions.co.za/jamroom/
www.tamilgsm.com/new/
www.testjam.com
www.tetragrammatonproductionsltd.net/jamroom/
www.theoryworks.com.au
www.tty2.eu
www.ukhhf.co.uk/jamroom/
www.vi2k.co.uk
www.williamsonmedia.com/jamroom/
www.xyphire.com/jamroom/
|

# If you are a Licensed Jamroom User, you are free to remove ALL references to Jamroom or Jamroom.net from any of the OUTPUT templates (i.e. Artist Themes, Ranking templates, chart templates, etc.).

# Matches #
matches [

# Default search input tag
{ :text=>'<input type="text" name="search_string" class="jform s_input" style="width:300px;">' },

# Meta Designer
{ :text=>'<meta name="designer" content="Talldude Networks, LLC.">' },

# Powered by link HTML
{ :regexp=>/<a href="http:\/\/www.jamroom.net"><img src="[^"]*" alt="Powered by Jamroom - the Powerful Social Media Platform" title="Powered by Jamroom - the Powerful Social Media Platform" border="0"><\/a>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Jamroom ([\d\.]+)">/ },

]

end

