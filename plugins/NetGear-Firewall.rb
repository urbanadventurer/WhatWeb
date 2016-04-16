##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetGear-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "The NETGEAR ProSafe wired and wireless VPN solutions offer SMB's a variety of security and remote access options. The ProSafe line of VPN Firewalls deliver all-inclusive business-class security as the first line of defense against network attacks and unauthorized access. The ProSafe SSL VPN Concentrator sits behind the firewall and delivers secure, clientless, Web-based remote access."
website "http://www.netgear.com.au/au/Products/VPN-Firewalls"

# ShodanHQ results as at 2011-03-18 #
# 5 for NETGEAR Firewall port:80



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^NETGEAR Firewall$/ },

]

end

