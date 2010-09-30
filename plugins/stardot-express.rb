##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Stardot-Express" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "The Express 6 Video Server is a small standalone server that streams video from up to six video cameras that plug into the back of it. - homepage: http://www.stardot-tech.com/"

# 20 results for intitle:"Express6 Live Image" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1552
examples %w|
mainstreetbridge.bounceme.net
206.169.19.20
99.70.81.193
www.catamarinecam.com
63.134.172.4
mackison.dyndns.org:8081
76.79.136.149
80.220.9.53:8081
camarastratus.webhop.net
66.181.146.250
208.138.21.48
38.99.247.58
|

matches [

{ :regexp=>/<title>Express6 Live Image[\ Popup]*<\/title>/, :version=>"6" },

{ :text=>'  <tr><td><a href="http://www.stardot-tech.com" target="_new"><img src="logo.gif" alt="" width="227" height="45" border="0"></a></td>' },

{ :text=>'  <tr><td><a href="http://www.stardot.com" target="_blank"><img src="logo.gif" alt="" width="227" height="45"></a></td>' },

]


end

