##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DataflexViNE-VoIP-IAD" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "The ViNE range of VoIP ADSL and VoIP SHDSL IADs support both SIP and MGCP protocols depending on the infrastructure and application for VoIP. Remote updates are possible to switch between either VoIP protocols and VoDSL. - Homepage: http://www.dataflex.com/"

# ShodanHQ results as at 2011-04-11 #
# 2,609 for DataflexViNE-Webserver



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/DataflexViNE-Webserver\/([\d\.]+)/) } if @headers["server"] =~ /DataflexViNE-Webserver\/([\d\.]+)/

	# Return passive matches
	m
end

end

