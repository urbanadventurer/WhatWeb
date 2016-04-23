##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Visualware-MyConnection-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "MyConnection Server (MCS) delivers a broad range of support managed automated and user initiated self-help connection testing and monitoring services directly via the browser to any online customer/location anywhere in the world. MCS incorporates testing solutions for critical time dependent applications such as VoIP, Video, IPTV, video conferencing."
website "http://www.myconnectionserver.com/"
# Default login: admin/admin123

# ShodanHQ results as at 2011-05-30 #
# 306 for Visualware MyConnection Server

# Google results as at 2011-05-30 #
# 25 for intitle:"MyConnection" "MyConnection Server" ("expires in"|EXPIRED)
# 30 for intitle:"MyConnection" "Visualware" ("expires in"|EXPIRED)
#  4 for intitle:"MyConnection Server Log In" "inurl:myspeed/login +Username

# Dorks #
dorks [
'intitle:"MyConnection" "MyConnection Server" ("expires in"|EXPIRED)'
]



# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Begin MyConnection Server applet -->' },

# HTTP Server Header 
{ :regexp=>/^Visualware MyConnection Server/, :search=>"headers[server]" },

# HTTP Server Header # Version Detection
{ :version=>/^Visualware MyConnection Server [^\d]+ (\d\.[^\s]+)$/, :search=>"headers[server]" },

# HTTP Server Header # Edition Detection
{ :string=>/^Visualware MyConnection Server ([^\d]+) \d\.[^\s]+$/, :search=>"headers[server]" },

]

end

