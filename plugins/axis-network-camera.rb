##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Axis-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.1"
description "Axis network camera - homepage: http://www.axis.com/"
examples %w|
64.29.78.157/indexFrame.shtml
209.113.157.25/indexFrame.shtml
93.83.1.9/indexFrame.shtml
220.130.238.47/view/indexFrame.shtml
129.57.20.46:1497/view/indexFrame.shtml
205.155.65.48/indexFrame.shtml
211.79.137.216/indexFrame.shtml
habirocam.city.ina.nagano.jp/indexFrame.shtml
quadcam.gordon.edu/indexFrame.shtml
220.130.238.47/view/indexFrame.shtml
lakecam.engr.wisc.edu/view/indexFrame.shtml
203.141.205.180/indexFrame.shtml
64.186.109.210/view/indexFrame.shtml
www.most.gizycko.pl/view/indexFrame.shtml
webcam.interwave.at/view/indexFrame.shtml
209.115.3.117/indexFrame.shtml
149.119.81.124
85.128.90.130
212.96.116.27
195.5.21.185
66.14.118.60
192.121.142.37
151.97.160.7
217.125.138.27
131.229.114.247
216.255.49.249
195.41.18.51
152.1.164.197
193.10.98.45
128.171.104.32
134.129.166.91
195.5.18.95
195.196.35.91
lslcam1.epfl.ch
128.255.26.210
158.193.80.15
webcam.st-malo.com
85.46.64.154
141.213.21.87
81.137.207.226
85.221.20.50
84.205.17.235
212.181.20.166
159.171.108.5
90.145.18.222
138.25.6.37/view/view.shtml
62.16.100.200/view/view.shtml
130.241.163.130/view/view.shtml
130.241.163.130/view/view.shtml
77.106.185.133/view/index.shtml
webcam.iubip.ru:8081/view/view.shtml
dinocam.sdsmt.edu/view/view.shtml
192.54.175.200/view/view.shtml
82.188.208.242/view/view.shtml
91.137.12.2/view/view.shtml
141.32.4.72/view/view.shtml
webcam03.deg.net
66.163.131.195
137.229.91.245
212.59.162.17:82
66.35.137.236
www.vladimir-city.ru:8080
brainiactrivia.tripod.com
208.42.203.54:8585/view/view.shtml
webcam.etvj.ch
www.sugarmountainfarms.com
burch.nlenet.com/view/view.shtml
osteriaecucina.axiscam.net
193.40.245.183
217.71.245.162/view/view.shtml
150.214.222.100
64.57.178.85
198.188.13.110/view/indexFrame.shtml
148.213.21.243/view/view.shtml
195.73.15.148:82/view/view.shtml
216.123.238.207/view/view.shtml
129.57.20.46:1497/view/indexFrame.shtml
bouwcam.science.uva.nl/view/index.shtml
66.188.23.142:1025/view/index.shtml
128.253.181.41/view/view.shtml
lakecam.engr.wisc.edu/view/view.shtml
195.243.185.195/view/view.shtml
camera.buffalotrace.com/view/view.shtml
85.144.61.15:8051
kroacam.dyndns.org
88.53.197.250/view/view.shtml
128.46.253.10/view/view.shtml
71.13.68.126/view/view.shtml
62.63.15.129:2556/view/view.shtml
bilkamera.dyndns.org
66.212.0.40/view/view.shtml
72.17.163.244/view/view.shtml
72.10.224.194/view/view.shtml
www.dattaway.net:8000/view/view.shtml
gotchacams.com/camviews.php
82.135.124.180/view/view.shtml
193.40.110.163/view/view.shtml
|

matches [

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1812
# 312 results @ 2010-06-27
# This ghdb syntax is not supported in whatweb 0.4.4
{:name=>'GHDB: allintitle: Axis 2.10 OR 2.12 OR 2.30 OR 2.31 OR 2.32 OR 2.33 OR 2.34 OR 2.40 OR 2.42 OR 2.43 "Network Camera"',
:certainty=>75,
:ghdb=>'allintitle: Axis 2.10 OR 2.12 OR 2.30 OR 2.31 OR 2.32 OR 2.33 OR 2.34 OR 2.40 OR 2.42 OR 2.43 "Network Camera"'
},

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1811
# 475 results @ 2010-06-27
# This ghdb syntax is not supported in whatweb 0.4.4
{:name=>'GHDB: intitle:"Live View / . AXIS" | inurl:view/view.shtml OR inurl:view/indexFrame.shtml | intitle:"MJPG Live Demo" | "intext:Select preset position"',
:certainty=>75,
:ghdb=>'intitle:"Live View / . AXIS" | inurl:view/view.shtml OR inurl:view/indexFrame.shtml | intitle:"MJPG Live Demo" | "intext:Select preset position"'
},

# http://www.hackersforcharity.org/ghdb/?function=detail&id=287
# 23 results @ 2010-06-27
{:name=>'GHDB: inurl:indexFrame.shtml intitle:Axis -inurl',
:certainty=>75,
:ghdb=>'inurl:indexFrame.shtml intitle:Axis -inurl'
},

{:name=>'default video server title #1',
:certainty=>100,
:text=>'<TITLE>AXIS Video Server</TITLE>'
},

{:name=>'default video server title #2',
:certainty=>100,
:regexp=>/<TITLE>Live View [\/]* - AXIS [0-9a-zA-Z\+]+ Video Server<\/TITLE>/i
},

{:name=>'default frame html',
:certainty=>100,
:text=>'<FRAME NAME="WhatEver" SRC="/incl/whatever.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>'
},

{:name=>'default trash frame',
:certainty=>100,
:text=>'	<FRAME NAME="Trash" SRC="/view/trash.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>'
},

{:name=>'default temp frame',
:certainty=>100,
:text=>'      <FRAME NAME="Temp" SRC="/view/temp.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>'
},

{:name=>'default noscript text',
:certainty=>100,
:text=>'Your browser has JavaScript turned off.<br>For the user interface to work effectively, you must enable JavaScript in your browser and reload/refresh this page.'
},

{:name=>'default video view title',
:certainty=>100,
:regexp=>/<TITLE>Live View [\/]* - AXIS [\da-zA-Z+]+ [MPEG\-2]*Network[\ Dome]* Camera[\ version]*[\ \d\.]*<\/TITLE>/i
},

{:name=>'default camera title',
:certainty=>100,
:regexp=>/<TITLE>[AXIS|Axis]+ [0-9]+ Network Camera<\/TITLE>/
},

{:name=>'default img src',
:certainty=>100,
:regexp=>/<[IMG|img]+ SRC="\/pics\/AxisLogo.gif" WIDTH="95" HEIGHT="40" BORDER="0" ALIGN="right" ALT="[AXIS Website - www.axis.com]*">/
},


]

def passive
        m=[]


	# <TITLE>Axis 2100 Network Camera 2.34</TITLE>
	# <TITLE>Axis 2120 Network Camera 2.42</TITLE>
	# <TITLE>Axis 2120 Network Camera 2.43</TITLE>
	# <TITLE>Axis 2120 Network Camera 2.33</TITLE>
	# <TITLE>AXIS 2420 Network Camera 2.43</TITLE>
	# <TITLE>Axis 2120 Network Camera 2.40</TITLE>
	# <TITLE>Axis 2100 Network Camera 2.42</TITLE>

        if @body =~ /<TITLE>[AXIS|Axis]+ [0-9]+ Network Camera [\d\.]+<\/TITLE>/
                version=@body.scan(/<TITLE>[AXIS|Axis]+ [0-9]+ Network Camera ([\d\.]+)<\/TITLE>/)[0].to_s
                m << {:certainty=>100,:name=>"default title for AXIS 2000 series",:version=>version}
        end


	# <title>Live view  - AXIS 231D+ Network Dome Camera</title>
	# <TITLE>Live view / - AXIS 205 Network Camera version 4.05</TITLE>
	# <title>Live view  - AXIS 206W Network Camera version 4.11</title>

        if @body =~ /<TITLE>Live View [\/]* - AXIS [\da-zA-Z]+ [MPEG\-2]*[Network Camera ]*version [\d\.]+<\/TITLE>/i
                version=@body.scan(/<TITLE>Live View [\/]* - AXIS [\da-zA-Z]+ [MPEG\-2]*[Network Camera ]*version ([\d\.]+)<\/TITLE>/i)[0][0]
                m << {:certainty=>100,:name=>"default title for AXIS 200 series",:version=>version}
        end


        m

end


end

