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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^CommuniGatePro\/([^\s]+)$/) } if @headers["server"] =~ /^CommuniGatePro\/([^\s]+)$/

	# Return passive matches
	m
end

end

