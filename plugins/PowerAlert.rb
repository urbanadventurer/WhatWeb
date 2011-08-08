##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerAlert" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "PowerAlert monitors and controls UPS Systems, PDUs, sensors, and the computers and equipment they support. - Homepage: http://www.tripplite.com/en/products/poweralert-software.cfm"

# ShodanHQ results as at 2011-05-23 #
# 771 for PowerAlert Login
#  50 for PowerAlert -Login

# Examples #
examples %w|
129.120.253.13
72.5.80.144
129.120.253.236
200.33.20.4
74.143.181.208
207.253.192.101
174.136.34.138
216.162.156.59
208.68.162.250
166.143.183.153
67.207.111.18
168.48.21.10
70.35.63.210
71.201.202.108
209.190.233.25
209.190.231.226
208.75.45.91
|

# Matches #
matches [

# Protected Object # This might be used by other software running on Netsilicon
{ :certainty=>25, :text=>'<h1>Protected Object</h1>This object on the Netsilicon is protected.<p>Return to <A TARGET="_top" HREF="index.html">Last page</A><p>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^PowerAlert HTTP server, powered by Allegro-Software-RomPager$/

	# WWW-Authenticate Header
	m << { :name=>"WWW-Authenticate Header" } if @headers["www-authenticate"] =~ /^Basic realm="PowerAlert [\d]+ Login"$/
	m << { :name=>"WWW-Authenticate Header" } if @headers["www-authenticate"] =~ /^Basic realm="PowerAlert Access Realm[\d]+"$/

	# Return passive matches
	m
end

end

