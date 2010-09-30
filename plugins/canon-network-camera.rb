##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Canon-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.1"
description "Canon's new all-in-one VB-C50i and VB-C50iR (in a reverse mount) pan/tilt/zoom (PTZ) network video cameras allow individuals, whether in the back storage room or airport waiting room, to remotely view live video footage even in the most adverse conditions. - http://www.usa.canon.com/templatedata/pressrelease/20040331_vbc50i.html"
# Design spec: http://www.usa.canon.com/app/pdf/nvideo/VB-C50i_AE_Spec_May1_07.pdf

examples %w|
ebdemo.8800.org:65309
webcam.lenna.com.au
218.224.118.87
actbwebcam.uwyo.edu
192.244.149.127
p2013-ipadfx01akita.akita.ocn.ne.jp/sample/LvAppl/lvappl.htm
80.75.224.71/sample/LvAppl/lvappl.htm
62.44.223.185/sample/LvAppl/lvappl.htm
208.180.39.56/sample/LvAppl/lvappl.htm
86.101.180.49/sample/LvAppl/lvappl.htm
209.165.175.132/sample/LvAppl/lvappl.htm
86.101.179.113/sample/LvAppl/lvappl.htm
194.208.34.74/sample/LvAppl/lvappl.htm
61.199.84.248/sample/LvAppl/lvappl.htm
24.123.188.36/sample/LvAppl/lvappl.htm
220.109.217.98/sample/LvAppl/lvappl.htm
218.227.159.88/sample/LvAppl/LvAppl.htm
61.202.243.90/sample/LvAppl/LvAppl.htm
68.224.171.35/sample/LvAppl/lvappl.htm
210.150.183.66/sample/LvAppl/LvAppl.htm
128.114.17.86/sample/LvAppl/lvappl.htm
view.city.wajima.ishikawa.jp/sample/LvAppl/lvappl.htm
207.202.157.37/sample/LvAppl/lvappl.htm
webcam.mtrv.com/lvappl.htm
61.119.26.243/sample/LvAppl/LvAppl.htm
61.213.216.178/sample/LvAppl/lvappl.htm
cateye-down.msu.montana.edu/sample/LvAppl/lvappl.htm
scicomwebcam.chem.unc.edu/sample/LvAppl/lvappl.htm
221.113.250.50/sample/LvAppl/lvappl.htm
www.tomhilleary.tv/sample/LvAppl/lvappl.htm
webcam.europegarden.it/sample/LvAppl/lvappl.htm
61.115.123.234/sample/LvAppl/lvappl.htm
220.254.92.210/sample/LvAppl/LvAppl.htm
193.5.27.52/sample/LvAppl/lvappl.htm
203.208.124.4/sample/LvAppl/sample.htm
cam1.ogachi.jp/sample/LvAppl/lvappl.htm
219.124.49.59/sample/LvAppl/LvAppl.htm
195.16.83.254/sample/LvAppl/lvappl.htm
220.254.31.66/sample/LvAppl/lvappl.htm
219.99.222.220/sample/LvAppl/lvappl.htm
195.18.181.53/sample/LvAppl/lvappl.htm
www.ric.hi-ho.ne.jp/baltiyev/lvappl.htm
194.183.129.211/sample/LvAppl/lvappl.htm
209.206.253.98/local/lvappl.htm
216.211.176.64/sample/LvAppl/LvAppl.htm
webcam.newham.gov.uk/sample/LvAppl/LvAppl.htm
www.abano.at/lvappl.htm
82.147.33.164/sample/LvAppl/lvappl.htm
82.141.104.134/sample/LvAppl/lvappl.htm
67.134.132.100/sample/LvAppl/lvappl.htm
208.255.200.46/sample/LvAppl/lvappl.htm
202.215.166.140/sample/LvAppl/LvAppl.htm
194.107.20.16/sample/LvAppl/lvappl.htm
202.81.246.111/local/LvAppl/lvappl.htm
218.44.75.94/sample/LvAppl/lvappl.htm
201.155.192.239:81/sample/LvAppl/lvappl.htm
220.96.208.132/sample/LvAppl/lvappl.htm
62.214.9.122/sample/LvAppl/lvappl.htm
mihamalive.aa2.netvolante.jp:8080/sample/LvAppl/lvappl.htm
202.215.14.7/sample/LvAppl/LvAppl.htm
takinecs1.city.tamura.lg.jp/sample/LvAppl/lvappl.htm
webrivanuova.camping.it/sample/LvAppl/lvappl.htm
cam1.fbc.jp/sample/LvAppl/lvappl.htm
80.53.153.146/sample/LvAppl/lvappl.htm
128.164.157.202/sample/LvAppl/LvAppl.htm
douga02.sizenken.biodic.go.jp/sample/LvAppl/lvappl.htm
218.45.13.216/sample/LvAppl/LvAppl.htm
web.tia.ad.jp/eclipse2001/ForStaff/LvAppl.html
94.125.78.190/sample/LvAppl/LvAppl.htm
141.76.66.112/sample/LvAppl/lvappl.htm
61.209.195.188/sample/LvAppl/lvappl.htm
webcamera2.hamamatsu-kagakukan.jp/sample/LvAppl/LvAppl.htm
195.62.165.58/sample/LvAppl/lvappl.htm
www.stamparapida.com/poligrafica_sito/webcam_test/lvappl.htm
61.118.212.93/sample/LvAppl/lvappl.htm
125.200.168.24/sample/LvAppl/LvAppl.htm
219.96.133.145/sample/LvAppl/LvAppl.htm
210.142.247.196/sample/LvAppl/LvAppl.htm
60.56.193.212/local/lvappl.html
220.254.0.212/sample/LvAppl/lvappl.htm
123.2.171.109/sample/LvAppl/lvappl.htm
61.199.29.197/sample/LvAppl/lvappl.htm
camera.konan-wu.ac.jp/lvappl.htm
132.239.8.4/sample/LvAppl/LvAppl.htm
219.163.183.16/sample/LvAppl/LvAppl.htm
210.128.201.53/sample/LvAppl/lvappl.htm
cam1.town.aizumisato.fukushima.jp/sample/LvAppl/lvappl.htm
220.96.193.211/sample/LvAppl/lvappl.htm
211.17.17.212/sample/LvAppl/lvappl.htm
210.143.245.109/sample/LvAppl/LvAppl.htm
97.67.17.235/sample/LvAppl/lvappl.htm
61.126.185.251/sample/LvAppl/lvappl.htm
219.166.90.58/sample/LvAppl/LvAppl.htm
|

matches [

# 268 results @ 2010-06-29
{:certainty=>75,:ghdb=>'intitle:liveapplet inurl:LvAppl'},

# 215 results @ 2010-06-29
# http://www.hackersforcharity.org/ghdb/?function=detail&id=434
{:certainty=>75,:ghdb=>'+intitle:"Network Camera VB-C50i/VB-C50iR" +"Viewer for PC"'},

# default VB-C50i title
{:text=>'<TITLE>Network Camera VB-C50i/VB-C50iR</TITLE>', :version=>'VB-C50i'},

# default javascript
{:text=>'function L(n,g) {var i=document.images[n]; if (i)I[n]=new H(i,i.src,"/v/"+g+".gif")}',:version=>"VB-C50i"},
{:text=>'function L(n,g) {var i=document.images[n];if (i)I[n]=new H(i,i.src,"/v/"+g+".gif")}',:version=>"VB-C50i"},

# default applet cabbase
{:text=>'<param name=cabbase	value="LiveApplet.cab">',:version=>"WebView"},

# default webview title
{:text=>'<title>LiveApplet</title>',:version=>"WebView"},

]

end

