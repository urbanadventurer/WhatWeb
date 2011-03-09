##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Datum-TymServe" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.1"
description "GPS NTP Network Appliances make it easy to manage and monitor time synchronization through workstations, servers and routers, thus assuring the highest integrity throughout the network. - Homepage: http://www.datum.com/"

# ShodanHQ results as at 2011-03-09 #
# 20 for DATM

# Examples #
examples %w|
192.77.171.2
130.158.254.26
138.26.185.249
65.97.248.100
208.77.216.230
208.65.0.25
|

# Matches #
matches [

# Model Detection
{ :model=>/<H2 ALIGN=CENTER>Datum TymServe ([^\s]+) Virtual Viewpoint<\/H2><P><!-- This is a clock that shows the system time -->/ },

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	m << { :version=>@meta["server"].scan(/^DATM\/([\d\.]{1,3})$/).to_s } if @meta["server"] =~ /^DATM\/([\d\.]{1,3})$/

	# Return passive matches
	m
end

end


