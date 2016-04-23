##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Citrix-Access-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-28
version "0.1"
description "Citrix Access Gateway is a secure application access solution that provides administrators granular application-level control while empowering users with remote access from anywhere."
website "https://www.citrix.com/English/ps2/products/product.asp?contentID=15005"

# ShodanHQ results as at 2012-03-28 #
# 29 for Cyms-SecS

# Google results as at 2012-03-28 #
# 44 for intitle:"Citrix Access Gateway" "To continue logon, use a Web browser that supports JavaScript or enable JavaScript in your current browser."

# Dorks #
dorks [
'intitle:"Citrix Access Gateway" "To continue logon, use a Web browser that supports JavaScript or enable JavaScript in your current browser."'
]



# Matches #
matches [

# Title
{ :text=>'<HTML><HEAD><TITLE>Citrix Access Gateway</TITLE>' },

# Shortcut Icon
{ :text=>'<link rel="SHORTCUT ICON" href="/vpn/images/AccessGateway.ico" type="image/vnd.microsoft.icon">' },

# HTML Comment
{ :text=>'<!--CONTENT CONTENT CONTENT CONTENT CONTENT--->' },

# div + HTML Comment
{ :text=>'</div><!---end of div c_logon_maincontent-->' },

# Set-Cookie # ezisneercsresu
{ :search=>"headers[set-cookie]", :regexp=>/ezisneercsresu=/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Cyms-SecS v[\d\.]+$/ },

]

end

