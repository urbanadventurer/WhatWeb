##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "StarDot-NetCam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "Stardot network camera web interface"
website "http://www.stardot-tech.com/ "
# default login: admin/admin

# 43 results for +intitle:"NetCam Live Image" -intitle @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1416


matches [

{ :regexp=>/<title>NetCam Live Image[\ Popup]*<\/title>/ },
{ :regexp=>/<applet code="CaptureClient.class" width="[\d]+" height="[\d]+" alt="NetCam Live [Stream|Image]+">/ },

# NetCam XL:
{ :regexp=>/<title>NetCamXL Live Image[\ Popup]*<\/title>/, :version=>"XL" },
{ :regexp=>/<applet code="CaptureClient.class" width="[\d]+" height="[\d]+" alt="NetCamXL Live [Stream|Image]+">/, :version=>"XL" },

]


end

