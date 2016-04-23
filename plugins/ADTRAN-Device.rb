##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##

Plugin.define "ADTRAN-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.2"
description "ADTRAN device - Total Access and NetVanta Network Management - Includes: Fast Ethernet switches, Gigabit Ethernet switches, Power over Ethernet Switches, Integrated switch-routers, Fixed port Routers, Modular Routers, Multiservice Access Routers, Internet security/firewall appliance, IP Business Gateways, IP Communication Platforms, IP Phones, Integrated Access Devices, 802.11a/b/g Wireless Access Points, Network Management"
website "http://www.adtran.com/web/page/portal/Adtran/group/3310"

# More Info #
# NetVanta: http://www.adtran.com/web/page/portal/Adtran/group/1
# Total Access: http://www.adtran.com/web/page/portal/Adtran/group/29

# ShodanHQ results as at 2011-05-31 #
# 31,198 for Total Access http -sip
# 28,870 for Total Access http -sip Gen
#  2,328 for Total Access http -sip -Gen
#     86 for netvanta http -sip

matches [

	# HTTP Server Header
	{ :regexp=>/^ADTRAN/, :search=>"headers[server]", :name=>"HTTP Server Header" },

	# NetVanta Series # Model Detection # WWW-Authenticate Header
	{ :string=>"NetVanta", :model=>/^Basic realm="Net[Vv]anta ([^"]+)"$/, :search=>"headers[www-authenticate]" },

	# Total Access Series # Model Detection # WWW-Authenticate Header
	{ :string=>"Total Access", :model=>/^Basic realm="Total Access ([^"]+)"$/, :search=>"headers[www-authenticate]" },

]

end

