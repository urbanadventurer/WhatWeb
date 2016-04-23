##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetComm-Wireless-HotSpot-Gateway" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-27
version "0.1"
description "NetComm Hotspot gateway device - http://www.netcomm.com.au/products/hotspots"

# ShodanHQ results as at 2011-08-27 #
# Also used by hotspot devices by 4ipnet and Air Live and other manufacturers
# 579 for adm admpwd language

# Google results as at 2011-08-27 #
# 1 for intitle:"Wireless Hotspot Gateway" "Welcome To Administrator Login Page"

# Dorks #
dorks [
'intitle:"Wireless Hotspot Gateway" "Welcome To Administrator Login Page"'
]



# Matches #
matches [

# Model Detection
{ :model=>"HS1100", :url=>"/imgs_login/login_r3_c4.gif", :md5=>"c2ad9dc7eefb06f310782039011bd508" },

# JavaScript
# Also used by hotspot devices by 4ipnet and Air Live and other manufacturers
{ :certainty=>25, :url=>"/", :regexp=>/if \(now < 946685000 \)[\s]+\{[\s]+alert\("Warning! The system time is wrong and may cause the inaccuracy of authentication and billing\. Please refer to the user manual to set up the correct system time\."\);/ },

# Welcome To Administrator Login Page
# Also used by hotspot devices by 4ipnet and Air Live and other manufacturers
{ :certainty=>25, :url=>"/", :text=>'<td colspan="8" align="center" background="imgs_login/login_r6_c7.gif"><font class="loginmsg"><strong>Welcome To Administrator Login Page<br> Please Enter Your User Name and Password To Sign In.</strong></font>&nbsp;</td>' },

]

end

