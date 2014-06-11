##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ADTRAN-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "ADTRAN device - Total Access and NetVanta Network Management - Includes: Fast Ethernet switches, Gigabit Ethernet switches, Power over Ethernet Switches, Integrated switch-routers, Fixed port Routers, Modular Routers, Multiservice Access Routers, Internet security/firewall appliance, IP Business Gateways, IP Communication Platforms, IP Phones, Integrated Access Devices, 802.11a/b/g Wireless Access Points, Network Management - Homepage: http://www.adtran.com/web/page/portal/Adtran/group/3310"

# More Info #
# NetVanta: http://www.adtran.com/web/page/portal/Adtran/group/1
# Total Access: http://www.adtran.com/web/page/portal/Adtran/group/29

# ShodanHQ results as at 2011-05-31 #
# 31,198 for Total Access http -sip
# 28,870 for Total Access http -sip Gen
#  2,328 for Total Access http -sip -Gen
#     86 for netvanta http -sip



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^ADTRAN, Inc\.$/ or @headers["server"] =~ /^ADTRAN$/
		m << { :name=>"HTTP Server Header" }
	end

	# NetVanta Series # Model Detection # WWW-Authenticate Header
	m << { :string=>"NetVanta", :model=>@headers["www-authenticate"].scan(/^Basic realm="Net[Vv]anta ([^"]+)"$/) } if @headers["www-authenticate"] =~ /^Basic realm="Net[Vv]anta ([^"]+)"$/

	# Total Access Series # Model Detection # WWW-Authenticate Header
	m << { :string=>"Total Access", :model=>@headers["www-authenticate"].scan(/^Basic realm="Total Access ([^"]+)"$/) } if @headers["www-authenticate"] =~ /^Basic realm="Total Access ([^"]+)"$/

	# Return passive matches
	m
end

end

