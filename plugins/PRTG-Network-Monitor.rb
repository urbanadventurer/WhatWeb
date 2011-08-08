##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PRTG-Network-Monitor" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "PRTG Network Monitor - Availability and Bandwidth Monitoring - Homepage: http://www.paessler.com/prtg"

# ShodanHQ results as at 2011-05-30 #
# 1,687 for PRTG

# Google results as at 2011-05-30 #
# 36 for "PRTG Network Monitor" intitle:"PRTG Network Monitor" "Password" "Login Name "GUI" inurl:"install_the_windows_gui"

# Dorks
dorks [
'"PRTG Network Monitor" intitle:"PRTG Network Monitor" "Password" "Login Name "GUI" inurl:"install_the_windows_gui"'
]

# Examples #
examples %w|
202.1.53.57
prtg.tchmachines.com
www.es.shipitsmarter.com
88.149.193.2
webmonitor.ietnetworks.com:8080
mail.hth.it
erostars.be
213.175.132.14
itv.no-ip.org:82
www.jtc-i.co.jp:86
64.244.58.154
prtg.demos.eaglegis.co.nz
wirns.na9d.net:8083
84.14.198.1
prtg.datahive.ca
home.se7en.co.nz:8000
csincsik.hu:8800
mail2.zax.ro
dns6.nwi.com.br
193.170.162.113:8080
65.255.143.30:8080
123.125.18.123:8787
remote.telluridehelpdesk.com:8181
ns1.pciol.net
204.13.230.61:8080
|

# Matches #
matches [

# Server Name Detection
{ :string=>/<title>PRTG Network Monitor \(([^\)]+)\)&nbsp;\|&nbsp;Welcome<\/title>/ },

# Version Detection
{ :version=>/<link rel="stylesheet" type="text\/css" href="\/css\/prtgmini\.css\?prtgversion=([^"]+)" media="print,screen,projection" \/>/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^PRTG\/([^\s]+)$/) } if @headers["server"] =~ /^PRTG\/([^\s]+)$/

	# Return passive matches
	m
end

end

