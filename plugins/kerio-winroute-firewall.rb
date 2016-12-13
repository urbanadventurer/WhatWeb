##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kerio-WinRoute-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-11
version "0.1"
description "Kerio WinRoute Firewall"
website "http://winroute.ru/kerio_winroute_firewall.htm"

# ShodanHQ results as at 2012-05-11 #
# 45 for Kerio WinRoute Firewall Embedded Web Server

# Google results as at 2012-05-11 #
# 6 for intitle:"Login Page - Kerio WinRoute Firewall"

# Dorks #
dorks [
'intitle:"Login Page - Kerio WinRoute Firewall"'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Kerio WinRoute Firewall Embedded Web Server$/ },

# Version Detection # Footer
{ :version=>/<A HREF="\/http_restr">Web policy<\/A><br>[\s]+Kerio WinRoute Firewall ([^\s^>]+)<br>&copy;/ },

# /nonauth/gfx/kerio_logo.gif # Logo # 6.x
{ :url=>"/nonauth/gfx/kerio_logo.gif", :md5=>"d9f42bd071f2f3f1dc7cdb628af4c596", :version=>"6.x" },

# Redirect Page
{ :text=>'<meta HTTP-EQUIV="Refresh" content="0;URL=/internal/ntlm/dologin.php?internal=0">	<title>Kerio WinRoute Firewall - Login Page - Kerio WinRoute Firewall</title>' },

]

end

