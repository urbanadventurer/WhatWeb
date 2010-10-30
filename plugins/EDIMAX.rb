##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EDIMAX" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "EDIMAX Device # Wireless Access Point / Broadband Routers / Ethernet Hub / Printer Server / Load Balancing Router - homepage:http://www.edimax.com"

# It's impossible to fingerprint the model without logging in #

# Wireless Access Point / Broadband Routers / Ethernet Hub / Printer Server #
# Default login: admin/1234
# Wireless Acesss Point / Load Balancing Router #
# Default Login: admin/password

# About 12,383 SHodanHQ results for WWW-Authenticate: Basic realm="Default: admin/1234"
# About 49 SHodanHQ results for "WWW-Authenticate: Basic realm=" "Default: admin/password"
examples %w|
84.111.104.73
84.111.190.21
89.216.27.79
61.250.78.55
83.130.123.44
212.93.154.236
123.0.211.163
91.144.142.42
84.232.21.232
81.182.227.48
88.135.174.201
125.15.148.25
218.226.215.11
122.25.226.187
|

matches [

# Default title
{ :text=>"<title>EDIMAX Technology</title>", :certainty=>75 },

# Access Point Status page # Default title
{ :text=>"<title>Access Point Status</title>", :url=>"/stainfo.asp" },

# Default EDIMAX logo
{ :md5=>"9691c1bcac34138f8245d95e2e003e55", :url=>"/images/banner_up_03.jpg" },

# Default JavaScript
{ :text=>"cdwindow=window.open('countdown.asp','CountDown','channelmode=0, directories=0,fullscreen=0,height=100,location=0,menubar=0,resizable=1,scrollbars=0,status=0,titlebar=0,toolbar=0,width=450','false');" },

# Default CSS
{ :text=>'<link rel="stylesheet" href="edimax.css">', :certainty=>75 },

]

# Passive #
def passive
	m=[]

	# Check Server
	if @meta["server"] =~ /GoAhead-Webs/

		# HTTP Server Header and WWW-Authenticate realm
		m << { :name=>"HTTP Server Header and WWW-Authenticate realm", :status=>401, :model=>"Wireless Access Point / Broadband Router / Ethernet Hub / Printer Server" } if @meta["www-authenticate"] =~ /Basic realm="Default: admin\/1234"/
		m << { :name=>"HTTP Server Header and WWW-Authenticate realm", :status=>401, :model=>"Wireless Access Point / Load Balancing Router" } if @meta["www-authenticate"] =~ /Basic realm="Default: admin\/password"/

	end

	m

end

end

