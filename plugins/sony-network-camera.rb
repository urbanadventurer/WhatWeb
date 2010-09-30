##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sony-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "SONY network video camera web interface - homepage: http://www.sony.com/"

# 29 Google results for intitle:"SONY Network Camera SNC-P1" @ 2010-06-29
# 7 Google results forinurl:home/homej.html intitle:"SNC-RZ30 home" @ 2010-06-29
# About 543 Shodan results for Server:NetEVI @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=349
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

matches [

# SNC-M
{ :text=>'	setWindowVar = window.open("/adm/file.cgi?next_file=setting.htm", "adminWin", setWinoptions);' },

# SNC-RZ
{ :text=>'<TITLE>Server Push Viewer</TITLE>' },
{ :regexp=>/<FRAME SRC="bar.html" SCROLLING="NO" NAME="sonyhome[0-9]*" NORESIZE[\ MARGINHEIGHT="0-9"]* MARGINWIDTH="0">/i },

]

def passive
        m=[]

	# SNC-P / SNC-M
        if @body =~ /<TITLE>SONY Network Camera [0-9A-Z\-]+<\/TITLE>/i
                version=@body.scan(/<TITLE>Sony Network Camera ([0-9A-Z\-]+)<\/TITLE>/i)[0][0]
                m << {:version=>version }
        end

        if @body =~ /<TITLE>SNC-RZ[0-9]+[\ HOME]*<\/TITLE>/
                version=@body.scan(/<TITLE>SNC-RZ([0-9]+)[\ HOME]*<\/TITLE>/)[0][0]
                m << {:version=>"SNC-RZ"+version }
        end

        m

end


end

