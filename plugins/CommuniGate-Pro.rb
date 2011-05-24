##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CommuniGate-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "CommuniGate Pro provides an integrated platform for Store-and-Forward (E-mail, Calendaring) and Real-Time (VoIP, Video, Instant Messaging, White Boards) communications over IPv4 and IPv6 networks. - Homepage: http://www.communigate.com/cgatepro/"

# ShodanHQ results as at 2011-05-23 #
# 9,594 for CommuniGatePro

# Examples #
examples %w|
208.42.184.243
66.18.70.50
209.190.212.8
84.246.196.173
12.185.81.67
87.224.134.190
212.71.47.51
79.99.248.5
217.14.192.50
142.103.75.236
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^CommuniGatePro\/([^\s]+)$/) } if @meta["server"] =~ /^CommuniGatePro\/([^\s]+)$/

	# Return passive matches
	m
end

end

