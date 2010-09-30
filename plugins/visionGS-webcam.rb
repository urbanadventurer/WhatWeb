##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VisionGS-Webcam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "VisionGS webcam web interface - homepage: http://www.visiongs.de/"

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1492
# 71 Google results for intitle:"VisionGS Webcam Software"|intext:"Powered by VisionGS Webcam" -intext @  2010-07-20
examples %w|
marco-island-beach.com
www.hnlservice.com/cam/webcam.html
www.jackfamily.org/webcam.html
www.bilderbank.ch/bienencam/webcam_bsp_vision.html
www.raptorclaw.net/rc/raptorcam/webcam.html
www.mavahome.com/WD-webfiles/webcam.html
www.alfred-fahr.com/Sicherheit/Jenamarktwebcam
css-jd.de/webcam.html
www.valdor.de/hamradio/webcam.html
www.sunshinehermann.de/html/webcam.html
www.hesselmann.de/main.htm
www.growingambition.nl/Webcam2/webcam.html
www.frohsinnmuelheim.de/webcam.html
www.rudloff-bremen.de/webcam.html
www.pec-computer.it/cam/
www.jolly-fellows.de/webcam.html
home.pages.at/horst/wcam/webcam.html
prof-berger.de
www.ulomek.de/cam.htm
www.hoffi2007.homedns.org/images/webcam.html
www.martin-zehrer.de/sau/webcam.html
dandelayru.com/webcam/webcam.html
www.wetter-bild.de/webcam.html
www.websitefrontier.com/hunting/webcam.html
rasul.net/webcam.html
homepage.ntlworld.com/millars/webcam.html
www.carpe-omnis-occasio.de/images/webcam.html
www.sam-city.eu/webcam/webcam.html
axelcom.de/webcam.html
www.klein4u.de/web.htm
www.hccola.de/webcam/webcam.html
heinz40.de/cam2/webcam.html
www.tele-torsti.de
www.carlo-cam.netwat.ch
www.johannes-zeughaus.de/index.html
www.klaus-roerig.de/webcam2.htm
www.coolfritz.de/bilder12/webcam.html
www.mengis.de/webcam/webcam.html
www.klaasdevries.org/webcam/webcam.html
kjara.150m.com/webcam.html
www.paternion.com/cam_stream/stream.html
sophies.150m.com/webcam.html
radio.web-castle.ch/live-webcam/webcam.html
poundmesilly.tripod.com/webcam.html
www.konietzke.info/webcam.html
fiedler-reichenbach.gmxhome.de/webcam.html
www.rattey.com/webcam/cam.htm
|

matches [

{ :text=>'<title>VisionGS Webcam Software</title>' },

{ :text=>'  <!-- VisionGS Still Code Begin -->' },

{ :regexp=>/<a href="http:\/\/www.visiongs.de\/"><font [size="1"\ ]*face="Verdana, Arial, Helvetica, sans-serif"[\ size="1"]*>VisionGS/ },

]


end

