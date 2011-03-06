##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Mobotix-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "MOBOTIX network camera web interface - homepage: http://www.mobotix.com/"
# Default login: admin/meinsm

# Google results as at 2010-07-20 #
# 335 for intext:"MOBOTIX M1" | intext:"MOBOTIX M10") intext:"Open Menu" Shift-Reload -intext
# 83 for (intitle:MOBOTIX intitle:PDAS) | (intitle:MOBOTIX intitle:Seiten) | (inurl:/pda/index.html +camera) -intitle
# 42 for inurl:/en/help.cgi "ID=*"

# Examples #
examples %w|
128.176.146.244
130.37.9.12
130.89.87.205
131.246.76.9
134.95.242.230
141.24.36.35
161.53.74.58
166.141.194.74
188.195.125.38:9191
195.149.216.51
195.70.120.133
195.84.98.146
212.179.81.246
212.18.192.78
212.184.187.254
212.50.216.141
212.70.178.18
213.255.188.107
217.159.173.158
217.196.77.178
217.24.53.18
217.24.53.18
217.7.254.153
217.91.114.181
217.91.47.110
217.91.69.155:11500
219.166.252.67:4020
24.222.113.226:8082
24.222.186.178:8081
43.244.202.181
61.127.232.44
61.45.37.116
62.202.21.101:81
62.202.21.101:82
68.115.199.210
79.14.27.201
79.5.151.145
80.120.166.69:811
80.120.199.18
80.122.227.94
80.123.188.35
81.198.187.6
81.207.36.167
81.221.14.233
81.221.18.246
81.75.180.231
82.104.33.83
82.115.174.126
82.139.212.92:50002
82.207.169.126:2000
82.57.247.71:81
83.216.160.101
85.126.79.100
85.13.14.69
85.194.140.154
85.47.147.27
85.8.92.1
87.139.32.229:82
87.139.32.229:84
87.247.196.9
87.28.180.181
88.116.209.210:9090
88.116.209.210:9091
88.26.178.142:4343
88.36.170.18:8001
90.146.188.52
91.114.124.66
92.65.174.61
aconline.de
alcalatf.dyndns.org:8082
blaser1.dyndns.org
bonzerosa.dyndns.org
cam01.heidturmweg.de
cam03.heidturmweg.de
cam04.heidturmweg.de
cam05.heidturmweg.de
cam06.heidturmweg.de
cam1.plavalaguna.hr
cam2.plavalaguna.hr
cam.sailin.de
daniel100.homeip.net:3000
denker-edv.dyn.leitwerk.net
dh5dy.dyndns.org
dresler.dnsalias.com:8084
falera.bamatik.ch
giebel-electronic.dyndns.biz:8082
haraldrenate.no-ip.org
hasserode.dyndns.org
hnhn.dyndns.tv:8400
huth-kunst-cam.dyndns.org
jm.is-a-chef.net
kaimeini.dyndns.org:82
karren.protask.at
kuhstall.triesdorf.de
lap.ath.cx
lindlarcam.dyndns.org
neupotzwebcam.dyndns.org
oberalbawetter.dyndns.org
parkhotelneubau.cnh.at
raceoffice.segel.aland.fi:81
regacam.usz.ch
r-r-h.dyndns.org:82
sb-kaerntner-ring.dyndns.org:804
sb-kaerntner-ring.dyndns.org:805
schmidt213.tobit.net:550
seeger-s.dyndns.org:8000
shunkskill2.dyndns.org
skiliftthal.dyndns.org
sonnleitn.dyndns.org:8888
tschappina.dyndns.org:8090
vso.aa0.netvolante.jp
webcam1.paninfo.com
webcamblankenese.dnsalias.net
webcam.comune.cantu.co.it
webcam.ltam.lu
webcam-mensa-hpr.ethz.ch
webcam.msinformatik.ch
webcam.rk-log.com
webcamsbt.dyndns.org
webcamtegernsee.no-ip.info
windpark-waltersdorf.dyndns.org
woustviller.dyndns.org:8065
www.ffs-server.de:8080
www.hex.at:3000
www.videovalvonta.fi
www.zaugghans.dyndns.org
zfw003-cccsd.selfip.com
|

# Matches #
matches [

# Meta Tags
{ :text=>'<meta name="publisher" content="MOBOTIX AG, Germany">' },
{ :text=>'<meta name="copyright" content="MOBOTIX AG, Germany">' },
{ :text=>'<meta name="author" content="Daniel Kabs, MOBOTIX AG, Kaiserslautern, Germany.">' },

# About Footer
{ :regexp=>/<font face="Helvetica,Arial" size="-2">	&copy;2001[\-0-9]{0,5} <a href="\/about.html">MOBOTIX AG<\/a>, Germany  &middot; <a href="http:\/\/www.mobotix.com\/">http:\/\/www.mobotix.com\/<\/a>/ },

# Firmware Detection # Default JavaScript
{ :firmware=>/var filesystem__version="[M0-1\-]*V([\d\.]+)";/ },

]

end

