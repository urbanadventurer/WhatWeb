##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Secure-SnapGear" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Secure SnapGear all-in-one Internet security appliances. Secure SnapGear can be deployed as just a firewall, as a VPN gateway, a UTM security appliance, or as a complete office network-in-a-box Internet appliance for small businesses, with all of the wide area networking tools needed to serve large enterprise remote offices."
website "http://www.snapgear.com/index.cfm?skey=1485"

# Google results as at 2011-05-31 #
# 18 for intitle:"Management Console" "Secure Computing SnapGear unit"
#  9 for intitle:"SnapGear Management Console" "Secure Computing SnapGear unit"

# Dorks #
dorks [
'intitle:"Management Console" "Secure Computing SnapGear unit"'
]



# Matches #
matches [

# Aggressive # /img/logo.ico
{ :url=>"/img/logo.ico", :md5=>"a27c392bc74b2d5c0e10fa7c1132c74d" },

# Model Detectiom
{ :model=>/<td class="menu"><div class="logo"><a href="\/cgi-bin\/cgix\/default"><img class="logo" alt="([^"]+)" src="\/img\/logo\.gif"><\/a>/ },

# The title is configurable # The device model is used by default
{ :string=>/<html><head><title>([^\s]+)\nManagement Console<\/title>/ },
{ :string=>/<html><head><title>([^\s]+) - SnapGear Management Console\n<\/title>/ },

]

end

