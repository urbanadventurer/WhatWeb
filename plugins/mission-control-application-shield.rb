##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mission-Control-Application-Shield" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "Mission Control Application Shield functions as a Web Application Firewall (WAF) and offers the following features: SSL offloading, single sign-on, high availability through system redundancy, backend server failover and load balancing, session fixation, cookie encryption, different methods of authentication (Radius, NTLM/Kerberos, LDAP), header and form validation and a live log viewer"
website "http://www.open.ch/1_1_2_1.html"

# Since when was session fixation a feature? Perhaps they meant single sign-on.
# Wait, what? It offers single sign-on AND session fixation? Go figure.

# Datasheet #
# http://www.open.ch/tl_files/OpenSystems/_img/1-1_mcss/ApplicationShield_Datasheet_Description.pdf

# ShodanHQ results as at 2011-08-25 #
# 14 for Mission Control Application Shield

# Google results as at 2011-08-25 #
# 2 for intitle:"Application Shield Notification" inurl:"CookieCheckError.shtml?trg="

# Dorks #
dorks [
'intitle:"Application Shield Notification" inurl:"CookieCheckError.shtml?trg="'
]



# Matches #
matches [

# Application Shield Notification page # Logo HTML
{ :text=>'<img id="logo" src="/srm-error-pages/images/logo.gif" alt="mission control application shield" ></td><td><p class="notification">Notification</p></td>' },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Mission Control Application Shield$/ },

]

end

