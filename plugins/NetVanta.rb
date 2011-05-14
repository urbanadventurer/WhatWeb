##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetVanta" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-14
version "0.1"
description "The NetVanta Series from Adtran includes: Fast Ethernet switches, Gigabit Ethernet switches, Power over Ethernet Switches, Integrated switch-routers, Fixed port Routers, Modular Routers, Multiservice Access Routers, Internet security/firewall appliance, IP Business Gateways, IP Communication Platforms, IP Phones, Integrated Access Devices, 802.11a/b/g Wireless Access Points, Network Management - Homepage: http://www.adtran.com/web/page/portal/Adtran/group/1"

# ShodanHQ results as at 2011-05-14 #
# 296 for netvanta
#  86 for netvanta port:80

# Examples #
examples %w|
68.68.225.14
216.14.189.254
209.152.97.209
208.88.61.65
208.88.57.186
65.89.126.170
66.0.131.49
209.152.73.121
|

# Passive #
def passive
	m=[]

	# Model Detection # WWW-Authenticate Header
	m << { :model=>@meta["www-authenticate"].scan(/^Basic realm="Netvanta ([\d]+)"$/) } if @meta["www-authenticate"] =~ /^Basic realm="Netvanta ([\d]+)"$/

	# Return passive matches
	m
end

end

