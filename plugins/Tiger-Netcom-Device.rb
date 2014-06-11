##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tiger-Netcom-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Tiger Netcom is a manufacturer and distributor of Voice over Internet Protocol (VoIP) equipment. - Homepage: http://www.vanaccess.com/"

# ShodanHQ results as at 2011-03-13 #
# 21 for TigerNetCom -SIP
# 30 for TigerNetCom



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^TigerNetCom\/([^\s]+)$/) } if @headers["server"] =~ /^TigerNetCom\/([^\s]+)$/

	# Return passive matches
	m
end
end

