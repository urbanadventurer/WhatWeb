##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DD-WRT" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-28
version "0.1"
description "DD-WRT is a Linux based alternative OpenSource firmware suitable for a great variety of WLAN routers and embedded systems."
website "http://dd-wrt.com/"

# A list of connected DHCP client hostnames and LAN IP addresses can be found
# on the home page around line 160 starting with: setDHCPTable

# Google results as at 2011-08-28 #
# 74 for intitle:"DD-WRT" intitle:build intitle:Info "DD-WRT Control Panel"

# Dorks #
dorks [
'intitle:"DD-WRT" intitle:build intitle:Info "DD-WRT Control Panel"'
]



# Matches #
matches [

# /images/favicon.ico
{ :url=>"/images/favicon.ico", :md5=>"9c003f40e63df95a2b844c6b61448310" },

# /style/logo.png
{ :url=>"/style/logo.png", :md5=>"4ec5945774160eb5db079e509a67a20e" },

# StyleSheet
{ :text=>'<link type="text/css" rel="stylesheet" href="style/pwc/ddwrt.css" />' },

# Version Detection # Title
{ :certainty=>75, :version=>/<title>DD-WRT \((build [^<^\)]+)\) - Info<\/title>/ },

# Model Detection
{ :model=>/<div class="setting">[\s]+<div class="label"><script type="text\/javascript">Capture\(status_router\.sys_model\)<\/script><\/div>[\s]+([^&]+)&nbsp;[\s]+<\/div>[\s]+<div class="setting">/ },

# Donate Link
{ :text=>'<a href="http://www.dd-wrt.com/">DD-WRT</a><br /><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank"><input type="hidden" name="cmd" value="_xclick" /><input type="hidden" name="business" value="paypal@dd-wrt.com" /><input type="hidden" name="item_name" value="DD-WRT Development Support" />' },

# MAC Address Detection
{ :string=>/<script type="text\/javascript">[\s]+\/\/<!\[CDATA\[[\s]+document\.write\("<span id=\\"(lan|wc|wl)_mac\\" style=\\"cursor:pointer; text-decoration:underline;\\" title=\\"" \+ share\.oui \+ "\\" onclick=\\"getOUIFromMAC\('([A-F\d:]{17})'\)\\" >"\);/, :offset=>1 },

]

end

