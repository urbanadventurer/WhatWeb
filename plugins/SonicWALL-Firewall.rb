##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SonicWALL-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "SonicWALL Firewall device - Homepage: http://www.sonicwall.com/us/products/Network_Security.html"

# Google results as at 2011-08-05 #
# 554 for intitle:"SonicWALL - Authentication" +Username +Password +Language

# ShodanHQ results as at 2011-03-13 #
# 124,518 for SonicWALL -VPN

# Dorks #
dorks [
'intitle:"SonicWALL - Authentication" "Username" "Password" "Language"'
]

# Examples #
examples %w|
66.92.37.53
199.7.197.34
77.235.189.66
210.245.193.157
62.7.88.18
75.64.137.63
213.82.101.126
96.54.192.195
66.193.26.66
76.72.245.42
77.43.10.146
clerk.hannibal-mo.gov
acutechnetworkservices.com
https://www.netech.edu
|

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

