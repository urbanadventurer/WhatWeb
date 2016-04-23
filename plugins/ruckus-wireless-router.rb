##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ruckus-Wireless-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-16
version "0.1"
description "Ruckus Wireless Router web interface"
website "http://www.ruckuswireless.com/"

# ShodanHQ results as at 2012-05-16 #
# 6,277 for Ruckus Wireless Inc

# Google results as at 2012-05-016 #
# 10 for intitle:"Ruckus Wireless Admin" "Ruckus Wireless Admin" "Username" "Password"

# Dorks #
dorks [
'intitle:"Ruckus Wireless Admin" "Ruckus Wireless Admin" "Username" "Password"'
]



# Matches #
matches [

# /images/logo_login.gif # Logo
{ :url=>"/images/logo_login.gif", :md5=>"5ba0bb42c0400280b45fb43500a6f0f5" },

# Logo HTML
{ :text=>'<div class="box"><img src="/images/logo_login.gif" width="173" height="52" alt="Ruckus Wireless" title="Ruckus Wireless" />' },

# SSID Detection # Signal Strength # aka "Air Quality" (what the fuck?)
{ :string=>/<td><h2>Air Quality:<\/h2><\/td>[\s]+<td><img src="images\/[^\/^\.]+\.gif" width="24" height="20" \/>\s*<span id="ssid">([^<^\s]+)<\/span><\/td>/ },

]

end

