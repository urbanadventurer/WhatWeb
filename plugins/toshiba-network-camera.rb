##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Toshiba-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Toshiba network camera web interface - homepage: http://www.toshiba.com/"

examples %w|
paulenwebcam.selfip.com:8080
72.16.246.75
72.16.246.72
70.167.100.166
168.96.148.129
72.16.246.88
local.fcnl.org:8080
72.55.9.132
hort104.hort.purdue.edu
liamsite.net:8081
66.126.196.68
65.60.86.226:8025
maplebank.hopto.org:8000
70.167.64.91:8000
70.168.37.6
webcam02.skydivechicago.com
www.abeaconinclay.org:81
66.126.196.69
cam1.sarh.net
maplebank.hopto.org:8001
khmerwestside.com
78.133.244.19
100.convergentnet.com
liamsite.net:8080
liamsite.net:8080
wc001.pen.okanagan.bc.ca
24.227.54.162:8002
66.126.196.67
209.206.175.123:8181
ferndalecathouse.com
216.109.201.253:85
65.60.86.226:8006
216.109.201.253:82
71.39.6.99
65.60.86.226:8011
72.16.246.89
shackie.is-a-geek.com:81
24.155.80.124:84
65.60.86.226:8010
72.16.246.71
65.60.86.226:8007
72.16.246.84
12.5.101.29:83
65.60.86.226:8009
72.16.246.87
169.244.212.158
webcam.childhooddiseases.org
72.16.246.73
67.83.47.155:85
72.16.246.85
72.16.246.83
65.60.86.226:8003
65.60.86.226:8013
72.16.246.69
|

matches [

{ :text=>'<title>TOSHIBA Network Camera - User Login</title>' },

{ :text=>'    <td height="32"><img src="toshiba.gif" width="68" height="12"><font class="netcam"><strong>&nbsp;&nbsp;Network Camera</strong></font></td>' },

]


end

