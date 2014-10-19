##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VisionGS-Webcam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "VisionGS webcam web interface"
website "http://www.visiongs.de/"

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1492
# 71 Google results for intitle:"VisionGS Webcam Software"|intext:"Powered by VisionGS Webcam" -intext @  2010-07-20


matches [

{ :text=>'<title>VisionGS Webcam Software</title>' },

{ :text=>'  <!-- VisionGS Still Code Begin -->' },

{ :regexp=>/<a href="http:\/\/www.visiongs.de\/"><font [size="1"\ ]*face="Verdana, Arial, Helvetica, sans-serif"[\ size="1"]*>VisionGS/ },

]


end

