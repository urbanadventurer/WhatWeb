##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "LanRTC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.2"
description "LanRTC Device"
website "http://www.dorma-time-access.de/prod/content/view/full/36922/%28code%29/product_detail/%28parent%29/36921"

# ShodanHQ results as at 2011-03-09 #
# 5 for LanRTC


# Matches #
matches [

# Logo
{ :url=>"/Logo.gif", :md5=>"2fe5a40924a7b13c61fcc66a7dacec94" },

# Model Detection # Default Heading
{ :model=>/<tr><td><h2>LanRTC([\d]{4})<br>System information<\/h2><\/td>/ },

# Model Detection # Default Title
{ :model=>/<title>LanRTC([\d]{4})-System information<\/title>/ },

# Logo
{ :text=>'<td align=right><h2><img src="Logo.gif" width="120" height="59" alt="MBB Gelma"></h2>' },

# Menu HTML
{ :text=>'<p><font size=-1><strong><a href="javascript:window.history.back()">Back</a> | <a href="Index.htm">System Info</a> | <a href="TmStatus.htm?TM=1">TM Status</a> | <a href="LanStat.htm">LAN Akt.</a> | <a href="de/Buchen.htm">Booking</a></strong></font></p></body></html>' },

# Version Detection # HTTP Server Header
{ :version=>/^LanRTC\/([\d\.]{1,5})$/, :search=>"headers[server]" },

# HTTP Server Header
{ :regexp=>/^LanRTC/, :search=>"headers[server]" },

]


end


