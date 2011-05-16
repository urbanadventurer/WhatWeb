##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-05-16 #
# Updated regex
# Added version detection
# Added server name detection
##
Plugin.define "Snap-Appliance-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Snap Appliance Server network attached storage (NAS) - homepage: http://www.overlandstorage.com/"

# Google results as at 2011-05-16 #
# 92 for inurl:config?Func=AboutSend
# 25 for intitle:"Snap Server" intitle:"Home" "Active Users"

# ShodanHQ results as at 2011-05-16 #
# 476 for Server: Snap Appliance, Inc
# 97 for Quantum Corporation

# Dorks #
dorks [
'intitle:"Snap Server" intitle:"Home" "Active Users"',
'inurl:config?Func=AboutSend'
]

# Examples #
examples %w|
74.221.131.34
144.118.68.34
208.226.167.184
216.153.251.181
206.181.245.173
64.80.233.122
www.metzgerwillard.net
gsti.miis.edu
bak.flinn.com
disk.com.hk
207.75.211.93
superstarpillowfight.com
gossamer.gsu.edu/config?Func=AboutSend
hamers.chem.wisc.edu
sunvic.info
eng.flinn.com
hatch.cpmc.columbia.edu
cruzi.pathology.northwestern.edu
www.sullivanne.com
qrc2.ess.washington.edu
chalk.salk.edu
phaedo.rutgers.edu
mercyhill-lakecountry.org
64.199.31.202
spamsnap80.engr.uc.edu
207.75.219.250
cruzi.pathology.northwestern.edu
gyre.cds.caltech.edu
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

# Matches #
matches [

# Server Name Detection # Default Title
{ :string=>/<TITLE>Snap Server ([^\s]+) \[[^\]]+\]<\/TITLE>/ },

# Server Name Detection # About Page # Default Title
{ :string=>/<HTML><HEAD><TITLE>About Snap Server ([^\s]+)<\/TITLE><\/HEAD>/ },

# Tech support link + image
{ :text=>'<A HREF="http://www.snapappliance.com/support" TARGET="new"><IMG SRC="/config/resource/Tech.gif"  ALIGN="TOP" NATURALSIZEFLAG="3" BORDER="0" ALT=""></A> '},

# JavaScript # _ShowAbout() link
{ :text=>'<A HREF="javascript:_ShowAbout()" onMouseOver="window.status=\'About Snap Server\'; return true;" onMouseOut="window.status=\'\'; return true;"><IMG SRC="/config/resource/About.gif"  ALIGN="TOP" NATURALSIZEFLAG="3" BORDER="0" ALT=""></A>' },

# JavaScript # /config?Func=AboutSend popup
{ :text=>'   window.open("/config?Func=AboutSend","AboutSnap","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,width=500,height=395,resizable=yes,dependent=yes"); '},

]

# Passive #
def passive
	m=[]

	# Version Detection # Snap Appliance(s) # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Snap Appliances?, Inc\.\/([\d\.]+)$/) } if @meta["server"] =~ /^Snap Appliances?, Inc\.\/([\d\.]+)$/

	# Version Detection # Quantum Corporation # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Quantum Corporation\.\/([\d\.]+)$/) } if @meta["server"] =~ /^Quantum Corporation\.\/([\d\.]+)$/

	# Return passive matches
	m
end

end

# An aggressive plugin could get the model, software version, firmware version and BIOS version from:
# /config?Func=AboutSend&Frame=Main

