##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed regex
##
Plugin.define "Panasonic-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.2"
description "Panasonic network cameras"

# About 18,400 Google results for inurl:"ViewerFrame?Mode=" @ 2010-07-20
# 288 Google results for inurl:"CgiStart?page=" @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=348
examples %w|
196.218.12.174
213.120.96.122:2000
90.152.43.80
196.218.12.174
62.117.68.222/Top
125.206.34.117/Top
142.36.244.87:8888/Top
202.212.193.26:555/Top
210.134.20.21/Top
210.155.223.251/Top
218.183.186.36:60008/Top
218.219.100.99:8090/Top
219.117.244.12/Top
219.127.83.130/Top
219.160.180.45:81/Top
219.160.180.45:83/Top
219.163.90.218/Top
220.254.124.250/Top
221.186.100.219/Top
221.254.133.53:8001/Top
60.43.33.196/Top
60.45.63.26/Top
61.119.240.67/Top
63.165.41.9/Top
65.42.42.31/Top
65.74.44.104:82/Top
66.209.109.2:60006/Top
70.54.178.135:60007/Top
80.161.75.72:81/Top
83.104.226.142/Top
aqua.aa3.netvolante.jp:85/Top
birdtable.derby-college.ac.uk/Top
bondy001.miemasu.net/Top
brandnew.miemasu.net:85/Top
cam108306.miemasu.net:8080/Top
cam181137.miemasu.net/Top
cam272769.miemasu.net/Top
cam69757.miemasu.net:60002/Top
cam86596.miemasu.net:82/Top
camera.myohoji.or.jp:60001/Top
collegio-cam.pittstate.edu/Top
hiyoko-1.miemasu.net/Top
hyobando.miemasu.net/Top
ikujien.miemasu.net:60001/Top
ito-marinetown.miemasu.net/Top
kamera-pecky.viewnetcam.com/Top
kumihama.or.jp/Top
kymskcmr.aa0.netvolante.jp/Top
miyakekaze.miemasu.net:82/Top
oma.miemasu.net/Top
ots.bne.jp/Top
riyoukannan.aa0.netvolante.jp:8081/Top
saltydogs.aa0.netvolante.jp:8080/Top
scorpius.jp:8484/Top
sdmis.portofsandiego.org:84
seisindenki.miemasu.net/Top
shintoku.miemasu.net/Top
wcam3.iacm.gov.mo/Top
weathercam.southlewis.org/Top
westernstatesglass.com:8180/Top
221.251.109.90:81/Top
193.138.213.169/Top
vetter.viewnetcam.com/Top
63.165.41.9/Top
202.61.19.114/Top
202.61.19.114/Top
99.89.143.46:8081/Top
12.107.134.185/Top
68.239.81.153:1026/Top
ots.bne.jp/Top
85.202.28.127:9080/Top
iiyudana.miemasu.net/Top
67.53.48.2/Top
210.156.129.164/Top
213.120.123.128:5000/Top
hakkay.ddo.jp/Top
cam.balloonfacility.com/Top
scam.ps-j.com:5888/Top
72.91.84.123:4000/Top
scorpius.jp:8484/Top
219.109.103.185/Top
141.213.21.42/Top
65.254.62.79/Top
65.254.62.79/Top
210.167.76.204/Top
bighbb.miemasu.net:82/Top
98.173.21.132:3001/Top
enders1.viewnetcam.com/Top
61.113.223.226/Top
218.47.39.195/Top
epiphany.xuserver.com:9011/Top
bansyo.mydns.jp/Top
221.184.67.34:81/Top
camera.logicbase.jp:5000/Top
125.163.244.223/Top
80.254.191.189:1024/Top
camera19.city.tarumizu.lg.jp/Top
125.163.177.199/Top
camera19.city.tarumizu.kagoshima.jp/Top
loveyone.dip.jp:8080/Top
210.155.223.251/Top
livefame-takano.nwcam.jp/Top
219.166.68.230/Top
happyone.monitoring-net.jp:60001/Top
218.219.195.243:8080/Top
125.163.251.243/Top
shonan-cc.aa0.netvolante.jp/Top
202.183.63.208/Top
camera.doriimu.jp:8080/Top
222.150.243.45/Top
nanaco.jpn.ph/Top
210.142.241.90/cgi-bin/Top
59.146.77.13/Top
219.117.194.183:60155/Top
cam3.uridium.ch/Top
kazenoya01wc.town.minamioguni.kumamoto.jp/Top
222.144.141.108:83/Top
67.214.239.16:8080/Top
weathercam.southlewis.org/Top
216.86.203.250/Top
67.93.36.140/Top
76.179.32.50/Top
122.1.124.18/Top
210.250.182.91/Top
68.190.217.238:81/Top
72.151.79.52:81/Top
70.245.71.120:2940/Top
94.81.219.133/Top
72.91.84.123:4000/Top
190.33.198.179/Top
66.193.198.11:8085/Top
203.179.132.153/Top
122.249.200.177/Top
cancafe.miemasu.net:50003/Top
weathercaster.miemasu.net:60001/Top
118.232.4.17/Top
88.87.110.54/Top
88.38.74.14/Top
210.128.81.133/Top
115.30.191.21/Top
219.123.221.44:50000/Top
www.shinmura.jp:8080/Top
80.254.165.0:81/Top
180.17.32.125/Top
212.248.90.130:33334/Top
data.weerstationoss.nl:49000/Top
61.112.228.136/Top
114.144.248.181/Top
210.161.154.236/Top
magnet-nz.ddns.cyberlabo.jp/Top
121.2.77.167:81/Top
94.82.129.162/Top
|

matches [

{ :text=>'<HEAD><TITLE>WJ-NT104 MAIN PAGE</TITLE></HEAD>', :version=>"WJ-NT104" },

{ :text=>'      <FONT FACE="Arial" STYLE="font-size: 24px" COLOR="#ffffff"><B>Network Camera</B></FONT>' },

{ :regexp=>/<BODY BACKGROUND="image\/Hcm1[0]?.gif" 		[\t]?BGCOLOR="#efefef" TEXT="#000000" LINK="#000000" 			VLINK="#000000" ALINK="#000000">/ },

{ :regexp=>/<FRAME name=bar src="CgiTagMenu?page=Top&Language=[\d]+" scrolling=no NORESIZE>/ },

# WJ-HD200/WJ-HD220 Digital Disk Recorder Series
{ :text=>'<META name="copyright" content="Copyright (C) 2003 Matsushita Electric Industrial Co., Ltd. All rights reserved.">' },
{ :text=>'<TITLE>Digital Disk Recorder WJ-HD220 CONTROL MAIN PAGE</TITLE>', :version=>"WJ-HD220" },
{ :text=>'<TITLE>WJ-HD200 DigitalDiskRecorder CONTROL MAIN PAGE</TITLE>', :version=>"WJ-HD200" },
{ :text=>'window.location.replace("/view/idconv.cgi?UID=%i&FILE=/hdrindex.html&PAGE="+myDate.getTime());' },

]

def passive
        m=[]

        if @body =~ /      <FONT FACE="Arial" STYLE="font-size: 16px" COLOR="#ffffff">/
                if @body =~ /        <B>([\d\-A-Z]+)<\/B>/
                        version=@body.scan(/        <B>([\d\-A-Z]+)<\/B>/)[0][0]
                        m << { :version=>version }
                end
        end

        m

end


end


