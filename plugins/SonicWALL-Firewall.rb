##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SonicWALL-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "SonicWALL Firewall device"
website "http://www.sonicwall.com/us/products/Network_Security.html"

# Google results as at 2011-08-05 #
# 554 for intitle:"SonicWALL - Authentication" +Username +Password +Language

# ShodanHQ results as at 2011-03-13 #
# 124,518 for SonicWALL -VPN

# Dorks #
dorks [
'intitle:"SonicWALL - Authentication" "Username" "Password" "Language"'
]



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^SonicWALL$/ },

# Detect if sslvpn option is allowed
{ :url=>"/auth1.html", :module=>/<div align="right">Click <a href="sslvpn" onClick="top\.location\.href='sslvpn'";>here<\/a> for (sslvpn) login/ },

# Firmware Version Detection
{ :url=>"/auth1.html", :firmware=>/<link href="swl_login-([^"]+)\.css" rel="stylesheet" type="text\/css">/ },

]

end

