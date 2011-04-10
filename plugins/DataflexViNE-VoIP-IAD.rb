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

# Examples #
examples %w|
151.84.179.193
87.216.189.1
87.216.61.57
151.69.32.129
151.58.47.185
151.69.121.165
87.216.53.89
151.93.146.36
151.58.222.105
151.84.131.78
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/DataflexViNE-Webserver\/([\d\.]+)/) } if @meta["server"] =~ /DataflexViNE-Webserver\/([\d\.]+)/

	# Return passive matches
	m
end

end

