##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Evo-Cam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-15
version "0.1"
description "EvoCam is the ultimate webcam software for Mac OS X - homepage: http://www.evological.com/evocam.html"

# http://www.hackersforcharity.org/ghdb/?function=detail&id=809
# 35 results for intitle:"EvoCam" inurl:"webcam.html" -intitle @ 2010-07-15
examples %w|
www.xs4all.nl/~radavi/webcam.html
www.imomsite.com/pages/yard/robin/webcam.html
www.paintbycommand.com/webcam.html
www.hotelaumajordavel.ch/de/webcam.html
216.67.98.153:8000/webcam.html
homepage.mac.com/jfstrain/webcam.html
grinnell.unh.edu:8080/webcam.html
pleasing.anywebcam.com/webcam.html
129.15.81.10:8080/webcam.html
brcl.sytes.net/webcam.html
imensen.com/webcam/webcam.html
129.115.90.27:8080/webcam.html
live.anessa.net/webcam.html
www.nhrubinos.com:8080/webcam.html
98.211.56.247:8080/webcam.html
shaga.edu.kyushu-u.ac.jp:8080/webcam.html
mapletonfire.no-ip.info:49115/webcam.html
blacksnow.serveftp.net:8081/1/webcam.html
dersch.tripod.com/webcam.html
www.mkhome.net:8080/webcam.html
www.tetonpeaks.org/webcam.html
berkeleyboi.tripod.com/webcam/webcam.html
korat.dyndns.tv:8080/webcam.html
|

matches [

{ :regexp=>/<title>EvoCam[\ \d]*<\/title>/ },

{ :regexp=>/<TITLE>EvoCam[\ Java|\ JavaScript]* Example Page<\/TITLE>/ },

{ :text=>'Powered by <A HREF="http://www.evological.com/evocam.html">EvoCam</A>' },

{ :regexp=>/<applet archive="evocam.jar" code="com.evological.evocam.class"[\ align="middle"]* [height|width]*="[\d]+" [height|width]*="[\d]+">/i },

{ :regexp=>/<param name="archive" value="evocam.jar">/i }

]


end

