##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Biromsoft-WebCam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Biromsoft webcam web interface - http://www.biromsoft.com/"

# 164 results for intitle:"Biromsoft WebCam" -download -serial -crack -the -a @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1491
examples %w|
69.62.143.103:6565
www.arcanis-webcam.friko.pl
www.karaboss.com/webcam/index2.htm
www.radioloud.fm/mediabox/
www.stonecircle.us/WebCam/cam.html
www.angelfire.com/wrestling3/irckamera/index.htm
www.hardebeck.net/index2.htm
valledelaserena.com/camara/
|

matches [

{ :text=>'<title>Biromsoft WebCam</title>', :certainty=>75 },

{ :regexp=>/<area shape="rect" coords="[\d\-,]+" href="http:\/\/www.biromsoft.com" alt="Visit BiromSoft " title="Visit BiromSoft ">/ },

{ :text=>'<area shape="rect" coords="22,26,151,102" href="http://www.biromsoft.com">' },

]


end

