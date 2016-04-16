##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TwonkyServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-17
version "0.1"
description "Twonky is a line of computer and mobile applications that finds all of your digital media collections and shares them with PCs, TVs, stereos and other devices connected to your network."
website "http://www.twonky.com/"

# Google results as at 2011-09-17 #
# 30 for inurl:":9000" PacketVideo corporation (intitle:"TwonkyMedia"|intitle:"TwonkyServer")

# ShodanHQ results as at 2011-09-17 #
# 3 for TwonkyMedia UPnP

# Dorks #
dorks [
'inurl:":9000" PacketVideo corporation (intitle:"TwonkyMedia"|intitle:"TwonkyServer")'
]



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/TwonkyMedia UPnP/ },

# Home Page
{ :text=>'<meta name="description" content="TwonkyMedia Digital Home">' },
{ :text=>'<td><strong><font color="#294A94" size="2">TwonkyMedia Settings</font></strong></td>' },

# /webbrowse
{ :text=>'<html><head><title>TwonkyServer Media Browser</title>' },
{ :text=>'<html><head><title>TwonkyMedia server media browser</title>' },
{ :string=>/<div id="copyright" class="copyright">Copyright . 2004-(20[\d]{2}) PacketVideo Corporation\. All rights reserved\.<\/div><\/div><hr>/ },
{ :string=>/<div id="copyright" class="copyright">Copyright&nbsp;&copy;&nbsp;2004-20(20[\d]{2}) PacketVideo&nbsp;Corporation\. All&nbsp;rights&nbsp;reserved<\/div><\/div><hr>/ },

]

end

