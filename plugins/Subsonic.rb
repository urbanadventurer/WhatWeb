##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Subsonic" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Subsonic is a free, web-based media streamer, providing ubiquitous access to your music. Based on Java technology, Subsonic runs on most platforms, including Windows, Mac, Linux and Unix variants. - Homepage: http://www.subsonic.org/pages/index.jsp"

# Google results as at 2011-08-07 #
# 13 for intitle:"Subsonic" +Username +Password "Remember me" inurl:login.view

# Dorks #
dorks [
'intitle:"Subsonic" "Username" "Password" "Remember me" inurl:login.view'
]

# Examples #
examples %w|
rokerz.com/login.view
wolff-den.com:8181/login.view
75.110.11.227:10217/login.view
thursbygarden.org:4040/login.view
94.195.246.158:4141/login.view
music.sameeryousuf.com/login.view
www.bananabend.net:8080/login.view
applieddigitalinc.dyndns.org/login.view
baxtr.homeip.net:8050
ww2.squareholepress.com:9191
gmusic.homedns.org
|

# Matches #
matches [

# input type="checkbox" name="_acegi_security_remember_me"
{ :text=>'<input type="checkbox" name="_acegi_security_remember_me" id="remember" class="checkbox" tabindex="3">' },

# Form HTML
{ :text=>'<form action="/j_acegi_security_check" method="POST">' },

]

end

