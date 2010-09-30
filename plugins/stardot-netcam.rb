##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "StarDot-NetCam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "Stardot network camera web interface - homepage: http://www.stardot-tech.com/ "
# default login: admin/admin

# 43 results for +intitle:"NetCam Live Image" -intitle @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1416
examples %w|
demo1.stardotcams.com
demo2.stardotcams.com
demo3.stardotcams.com
www.graco.unb.br/robwebcam/1.html
pnetcam.stanford.edu
62.49.17.87:8000
www.strathmere.tv
128.192.49.225
webcam.hartnell.edu
dcwebcam01-dllstx2.theplanet.com
65.41.37.5:81
69.20.137.132
207.47.91.115:8000
72.36.41.30:8085
198.99.188.239
72.165.142.107
nedcam.nednet.net
216.250.47.250:8080
webcam1.jacksonholeairport.com:81/popup.html
chamber.gotdns.com:8058
207.224.227.17
72.235.119.16:88
208.80.99.248:3380
72.235.176.210
138.26.132.205
tswcam.timeshareware.com
www.urbanmos.com/cam01.html
netcam.school.assumption.org
www.strataview.dns2go.com:8085
webcamfyard.sepe.com
209.33.198.233:81
194.144.19.40
199.185.138.3
162.42.197.246
64.5.44.170
129.252.89.85
72.214.4.100
209.193.77.51
68.105.244.171
|

matches [

{ :regexp=>/<title>NetCam Live Image[\ Popup]*<\/title>/ },
{ :regexp=>/<applet code="CaptureClient.class" width="[\d]+" height="[\d]+" alt="NetCam Live [Stream|Image]+">/ },

# NetCam XL:
{ :regexp=>/<title>NetCamXL Live Image[\ Popup]*<\/title>/, :version=>"XL" },
{ :regexp=>/<applet code="CaptureClient.class" width="[\d]+" height="[\d]+" alt="NetCamXL Live [Stream|Image]+">/, :version=>"XL" },

]


end

