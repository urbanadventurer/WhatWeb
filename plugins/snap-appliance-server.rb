##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Snap-Appliance-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Overland NAS - homepage: http://www.overlandstorage.com/"

# 20 results for intitle:"Snap Server" intitle:"Home" "Active Users"
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1560
# About 268 shodan results for Server: Snap Appliance, Inc. @ 2010-07-24
examples %w|
74.221.131.34
144.118.68.34
208.226.167.184
www.metzgerwillard.net
gsti.miis.edu
bak.flinn.com
disk.com.hk
207.75.211.93
superstarpillowfight.com
www.sullivanne.com
64.199.31.202
spamsnap80.engr.uc.edu
207.75.219.250
cruzi.pathology.northwestern.edu
snaps.gotdns.org
mme23.mme.wsu.edu
onenet.spitnimage.com
xray.chem.wisc.edu
coreserver.biochem.okstate.edu
deadsuperstar.com
server1.music.olemiss.edu
141.106.186.50
snaps.gotdns.org
onenet.spitnimage.com
|

matches [

{ :regexp=>/<TITLE>Snap Server [A-Z0-9\-\_]+ \[Home\]<\/TITLE>/ },
{ :text=>'            <A HREF="http://www.snapappliance.com/support" TARGET="new"><IMG SRC="/config/resource/Tech.gif"  ALIGN="TOP" NATURALSIZEFLAG="3" BORDER="0" ALT=""></A> '},
{ :text=>'   window.open("/config?Func=AboutSend","AboutSnap","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,width=500,height=395,resizable=yes,dependent=yes"); '},

]


end

