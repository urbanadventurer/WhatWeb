##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Visualware-MyConnection-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "MyConnection Server (MCS) delivers a broad range of support managed automated and user initiated self-help connection testing and monitoring services directly via the browser to any online customer/location anywhere in the world. MCS incorporates testing solutions for critical time dependent applications such as VoIP, Video, IPTV, video conferencing. - Homepage: http://www.myconnectionserver.com/"
# Default login: admin/admin123

# ShodanHQ results as at 2011-05-30 #
# 306 for Visualware MyConnection Server

# Google results as at 2011-05-30 #
# 25 for intitle:"MyConnection" "MyConnection Server" ("expires in"|EXPIRED)
# 30 for intitle:"MyConnection" "Visualware" ("expires in"|EXPIRED)
#  4 for intitle:"MyConnection Server Log In" "inurl:myspeed/login +Username

# Dorks #
dorks [
'intitle:"MyConnection" "MyConnection Server" ("expires in"|EXPIRED)'
]

# Examples #
examples %w|
traceroute-s2.prominic.net
support.amerivault.com:2546
www.astoriavillage.com
ispgeeksdiagnostics.net
chicago.ms.streamguys.com
amsterdam.mcs.streamguys.com
72.4.7.67
195.130.195.254
204.14.40.60
205.216.29.50
200.54.84.23
65.244.158.61
80.244.65.138
208.73.148.43
216.7.123.4
216.23.136.167
208.175.141.44
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Begin MyConnection Server applet -->' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Visualware MyConnection Server /

		# Version Detection
		m << { :version=>@meta["server"].scan(/^Visualware MyConnection Server [^\d]+ (\d\.[^\s]+)$/) } if @meta["server"] =~ /^Visualware MyConnection Server [^\d]+ (\d\.[^\s]+)$/

		# Edition Detection
		m << { :string=>@meta["server"].scan(/^Visualware MyConnection Server ([^\d]+) \d\.[^\s]+$/) } if @meta["server"] =~ /^Visualware MyConnection Server ([^\d]+) \d\.[^\s]+$/

	end

	# Return passive matches
	m
end

end

