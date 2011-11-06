##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Infinet-Wireless-WANFleX-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "Infinet Wireless WANFleX Router - Homepage: http://www.infinetwireless.com/products"

# ShodanHQ results as at 2011-08-13 #
# 554 for WANFlex HTTP Daemon

# Google results as at 2011-08-13 #
# intitle:"Login Page" "InfiNet Wireless" "All rights reserved." "User Name" +Password

# Dorks #
dorks [
'intitle:"Login Page" "InfiNet Wireless" "All rights reserved." "User Name" "Password"'
]

# Examples #
examples %w|
88.84.217.161
46.52.134.25
79.175.55.153
213.154.179.65
213.170.86.113
188.247.43.201
188.133.158.165
213.170.100.249
80.252.150.21
80.252.147.137
46.52.136.11
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="InfiNet Wireless Company" />' },

# Version Detection # Server Header
{ :search=>"headers[server]", :version=>/^WANFlex HTTP Daemon v([^\s]+)$/ },

]

end

