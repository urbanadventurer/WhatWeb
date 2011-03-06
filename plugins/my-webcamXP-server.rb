##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "My-WebCamXP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-24
version "0.2"
description "WebCamXP web interface - homepage: http://www.webcamxp.com"

# Google results as at 2010-07-24 #
# 332 Google results for "powered by webcamXP"
# 56 Google results for intitle:"my webcamXP server!" inurl:":8080"

# ShodanHQ results as at 2010-07-24 #
# About 94 Shodan results for Server:webcamXP

# Examples #
examples %w|
angelpage.dyndns.tv:8080
212.91.164.28:8080
ka7bgr.dyndns.org:8080
65.40.115.225:8080
66.93.98.195:8080
201.95.124.93:8080
184.74.128.164:8080
ruff-cuts.dyndns.org:8080
75.132.23.101:8080
pogona.dyn-o-saur.com:8080
86.89.114.160:8080
201.26.75.197:8080
skyhongkong.com
erattori.tripod.com
webcam.hobnobpet.com
62.147.155.139:8080
www.talla3.com:8088
www.miele-family.com/weather/
www.qsl.net/g0ohk/gallery/
these2boots.com/webcamCHAT.htm
collins-nz.homedns.org:8080
www.bredenbeek.net
70.80.195.110:8000
85.114.190.10:8081
122.154.103.2:8000
212.26.215.92:9090
65.40.115.225:8080
82.30.169.41:8080
72.241.200.185:8080
www.wire.boom.ru
82.89.210.115:8080
212.91.164.28:8080
www.justicecamera.ws43.com
184.74.128.164:8085
www.nicholsforever.com:7578
71.49.17.48:8050
72.151.246.109:8080
68.83.85.251:8080
server1.richardselectronics.net:8185
162.39.5.129:8081
168.243.148.172:8080
live.pravoslav.tv:8080
|

# Matches #
matches [

# Default Title
{ :text=>'<html><head><title>my webcamXP server!</title>' },

# Default h1 Heading HTML
{ :text=>'			<h1><span>webcamXP 5</span></h1>' },

# Default JavaScript
{ :text=>"newWindow = window.open(camstr, winstr, 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=' + width + ',height=' + height);" },

# Default Logo HTML
{ :text=>'<br><br><table border="1" cellpadding="0" cellspacing="0" bordercolor="#579A48"><tr><td><a href="http://www.webcamXP.com"><img src="http://www.darkwet.net/banners/webcamxp2.gif" width="88" height="31" border="0"></a>' },

# 401 unauthorized error page
{ :text=>'<html><head><title>webcamXP :: unauthorized access</title></head>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="webcamXP [^"]{0,15}v([\d\.]+)">/ },

# Version Detection # Link HTML
{ :version=>/mXP.com" target="_blank">webcamXP 5<\/a> v([\d\.]+)/ },

# Version Detection # Powered by text
{ :version=>/powered by <a href="http:\/\/www.webcamXP.com" target="_blank">webcamXP<\/a>[\ \d]* v([\d\.a-z\ ]+)<\/div>/ },

# Version Detection # Powered by text
{ :version=>/<\/td><\/tr><\/table><br>powered by webcamXP PRO[\ \d]* v([\d\.]+)<br><br><br><\/font><\/center><\/body><\/html>/ },

# Version Detection # Powered by text
{ :version=>/			powered by <a href="http:\/\/www.webcamxp.com" title="www.webcamxp.com">webcamxp 5<\/a> v([\d\.]+)/ },

# webcamXP 5 # 401 unauthorized error page
{ :version=>/powered by <a href="http:\/\/www.webcamXP.com" target="_blank">webcamXP 5<\/a> v([\d\.]+)<\/a>/ },

]

end

