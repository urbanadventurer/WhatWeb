##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ClipShare" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "With a huge variety of features and options, at an extremely affordable price, ClipShare is the ultimate video script for starting your highly profitable video sharing community website just like the big boys: Youtube, DailyMotion, Metacafe, or Google Video. - homepage: http://www.clip-share.com/"

# 204 results for "powered by ClipShare" @ 2010-08-21
examples %w|
darkorange.clipsharedemo.com
clearwater.clipsharedemo.com
clipshare.ffmpegplease.com
clipshare.ffmpeg-hosting.net
clipshare.desktopupload.com
8rd.net
amvvideo.com
egyflick.com
finku.com
ucuzvoip.com
britneyhd.com
kurdistanvideo.com
kidsvideosite.com
newhomevideos.ca
amfilms.hash.com
vidsio.com
lutube.org
pandachute.com
bodysporttv.com
playak.tv
shoofni.com
talnet.cz/clipshare/
videos.sitepronews.com
www.saywhattube.com
www.weird.tv
www.gsmtube.net
www.trailerspy.com
www.jewtube.com
www.ghanaclips.com
www.keertan.tv
www.sunsetvineapp.net
www.islamtube.com/server/
www.toonarab.com
www.deafcomputerguy.com
www.russbo.tv
www.zwtube.com
www.tubeindian.com
www.klicklac.com
www.bwmasti.com
www.allfightstv.com
www.mad2.com
www.telfazy.com
www.holidaysvideo.com
www.videogob.com
www.videosmania.tv
www.singitlikeme.com
www.delawareweddingchannel.com
www.jbmarkets.com
www.ahlulbaitvideo.com
www.tubejack.com
www.whowatch.com
www.bloopers.com
www.djbuzz.tv
www.castrunner.com
www.sunsessions.com
www.learnandgrow.tv
www.landvideo.net
www.karaokevideostars.com
www.sailinginnovation.tv
www.digitshow.com
www.istreak.com
www.quality-street.com
www.ikhwanwebtube.com
www.megadesitube.com
www.adventureeyetv.com
www.youtubeonlinenow.com
www.camcaps.com
www.prabhupadatube.com
www.vacvideo.com
www.bcstudio.tv
|

matches [

{ :text=>'<!--!!!!!!!!!!!!!!!!!!!!!!!!! Processing SCRIPT !!!!!!!!!!!!!!!!!!!-->' },
{ :text=>'<!--!!!!!!!!!!!!!!!!!!!!!!!! LIBRARY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->' },
{ :text=>'Powered By <a href="http://www.clip-share.com">ClipShare</a>' },

]


end

