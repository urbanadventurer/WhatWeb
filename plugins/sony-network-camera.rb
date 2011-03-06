##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated model detection
##
Plugin.define "Sony-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "SONY network video camera web interface - homepage: http://www.sony.com/"

# Google results as at 2010-06-29 #
# 29 for intitle:"SONY Network Camera SNC-P1"
#  7 for inurl:home/homej.html intitle:"SNC-RZ30 home"

# ShodanHQ results as at 2010-07-22 #
# 543 for Server:NetEVI

# Examples #
examples %w|
128.233.172.35
222.147.168.35
199.3.2.212
128.196.12.63
71.225.115.35
142.31.86.235
74.143.29.150
152.2.31.35/home/homeJ.html
152.3.125.165/en/index.html
222.124.220.243/en/AViewer.html
131.170.113.40/en/JViewer.html
apps.niagara.edu/webcams/cam1.php
70.141.63.105:8080/image1
thebittners.dyndns.org:9000
128.196.12.150/home/homeJ.html
www.apollodiveio.it/it/home/homeJ.html
greskos.com/cam/Gcam.html
212.174.34.170:10225/home/homeA.html
163.21.169.98/adrv/home/homeJ.html
www.7-milemarina.com/home/homeJ.html
207.108.37.243:33200/home/homeS.html
72.36.21.200/home/homeS.html
212.174.34.170:10225/home/homeA.html
66.55.123.5:8080/home/homeJ.html
207.108.37.243:33200/home/homeS.html
212.174.34.170:10225/home/homeA.html
163.21.169.98/adrv/home/homeJ.html
217.153.19.4/adrv/home/homeS.html
163.21.169.98/adrv/home/homeJ.html
207.108.37.243:33200/home/homeS.html
128.101.80.75/home/homeS.html
68.63.72.246/home/homej.html
66.191.76.78:8088/home/homeJ.html
|

# Matches #
matches [

# SNC-M
{ :text=>'	setWindowVar = window.open("/adm/file.cgi?next_file=setting.htm", "adminWin", setWinoptions);', :model=>["SNC-M"] },

# SNC-RZ / SNC-Z
{ :text=>'<TITLE>Server Push Viewer</TITLE>' },
{ :regexp=>/<FRAME SRC="bar.html" SCROLLING="NO" NAME="sonyhome[0-9]*" NORESIZE[\ MARGINHEIGHT="0-9"]* MARGINWIDTH="0">/i },

# Model Detection # SNC-P / SNC-M
{ :model=>/<TITLE>Sony Network Camera ([0-9A-Z\-]+)<\/TITLE>/i },

# Model Detection # SNC-RZ / SNC-Z
{ :model=>/<TITLE>(SNC\-[R]?Z[0-9]+)<\/TITLE>/ },
{ :model=>/<TITLE>(SNC\-[R]?Z[0-9]+) HOME<\/TITLE>/ },

]

end

