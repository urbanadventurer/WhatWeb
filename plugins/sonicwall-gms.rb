##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SonicWALL-GMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "The SonicWALL Global Management System (GMS) provides organizations of any size, distributed enterprises and service providers with a flexible, powerful and intuitive solution to centrally manage and rapidly deploy SonicWALL appliances and security policy configurations. SonicWALL GMS also provides centralized real-time monitoring, and comprehensive policy and compliance reporting."
website "http://www.sonicwall.com/emea/488_3042.html"

# Google results as at 2011-06-04 #
# 10 for intitle:"SonicWALL GMS Login" +User +Password
#  8 for intitle:"SonicWALL GMS Login" "License is valid"

# Dorks #
dorks [
'intitle:"SonicWALL GMS Login" "User" "Password"'
]



# Matches #
matches [

# Redirect Page # Version Detection # Global Management System
{ :version=>/<TITLE>SonicWALL Global Management System Version ([^\s^<])[\s]?<\/TITLE>/ },
{ :version=>/<P><B>SonicWALL Global Management System v([^\s^<]+)/ },

# Redirect Page # Version Detection # Universal Management Suite
{ :version=>/<TITLE>SonicWALL Universal Management Suite v([^\s^<]+)<\/TITLE>/ },
{ :version=>/<P><B>SonicWALL Universal Management Suite v([^\s^<]+)<\/B>/ },

# Login Page # /sgms/login and/or /sgms/auth # Title
{ :url=>"/sgms/login", :text=>'<title>SonicWALL GMS Login</title>' },
{ :url=>"/sgms/login", :text=>'<title>SonicWALL GMS Login Screen</title>' },

# Login Page # body
{ :text=>'<body background="images/gray_waves.back.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="onLoadFunc()">' },

]

end

