##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Infinet-Wireless-WANFleX-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-13
version "0.1"
description "Infinet Wireless WANFleX Router"
website "http://www.infinetwireless.com/products"

# ShodanHQ results as at 2011-08-13 #
# 554 for WANFlex HTTP Daemon

# Google results as at 2011-08-13 #
# intitle:"Login Page" "InfiNet Wireless" "All rights reserved." "User Name" +Password

# Dorks #
dorks [
'intitle:"Login Page" "InfiNet Wireless" "All rights reserved." "User Name" "Password"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="InfiNet Wireless Company" />' },

# Version Detection # Server Header
{ :search=>"headers[server]", :version=>/^WANFlex HTTP Daemon v([^\s]+)$/ },

]

end

