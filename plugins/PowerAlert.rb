##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerAlert" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "PowerAlert monitors and controls UPS Systems, PDUs, sensors, and the computers and equipment they support."
website "http://www.tripplite.com/en/products/poweralert-software.cfm"

# ShodanHQ results as at 2011-05-23 #
# 771 for PowerAlert Login
#  50 for PowerAlert -Login



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

