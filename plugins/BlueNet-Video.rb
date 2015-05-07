##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlueNet-Video" do
author "Andrew Horton" # 2015-05-07
version "0.1"
description "BlueNet Video Server is an device that can stream CTV video over the internet. It uses an ActiveX plugin. Product listing - http://kelgor.net/kelcart/products/Bluenet-Video-Server.html"
website "http://www.batblue.com/themes/BatBlue/videos/BlueNETVideo.html"

# Default port 8087

# Dorks
dorks [ 'intitle:"BlueNet Video Viewer"' ]

# Matches #
matches [
# Version in HTTP header
{ :string=>"window.location.href='/cgi-bin/client_execute.cgi?tUD=0';"},
{ :version=>/<title>BlueNet Video Viewer Version ([^<]+)<\/title>/, :url=>'/cgi-bin/client_execute.cgi?tUD=0'},
{ :string=>"clsid:4A7C606D-03DB-4E91-9AB0-275F5A4599FD", :url=>'/cgi-bin/client_execute.cgi?tUD=0'}
]
end
