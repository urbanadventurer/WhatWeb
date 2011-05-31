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
64.140.197.174
173.241.26.38
63.118.209.113
65.183.166.57
216.231.116.65
63.250.78.102
66.181.3.234
205.232.142.10
216.106.116.186
64.89.192.189
76.76.52.42
199.227.187.57
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^ADTRAN, Inc\.$/ or @meta["server"] =~ /^ADTRAN$/
		m << { :name=>"HTTP Server Header" }
	end

	# NetVanta Series # Model Detection # WWW-Authenticate Header
	m << { :string=>"NetVanta", :model=>@meta["www-authenticate"].scan(/^Basic realm="Net[Vv]anta ([^"]+)"$/) } if @meta["www-authenticate"] =~ /^Basic realm="Net[Vv]anta ([^"]+)"$/

	# Total Access Series # Model Detection # WWW-Authenticate Header
	m << { :string=>"Total Access", :model=>@meta["www-authenticate"].scan(/^Basic realm="Total Access ([^"]+)"$/) } if @meta["www-authenticate"] =~ /^Basic realm="Total Access ([^"]+)"$/

	# Return passive matches
	m
end

end

