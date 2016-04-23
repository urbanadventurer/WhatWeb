##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Procon-Electronics-Mod-Mux" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Procon Electronics Mod-Mux (Serial/Ethernet Converter & Modbus Gateway) is a MODBUS TCP Converter. This converter is used to connect an Ethernet network to a RS485/232 network, and converts the Modbus TCP protocol to the standard Modbus RTU serial protocol on RS485/232."
website "http://www.proconel.com/"

# ShodanHQ results as at 2011-07-27 #
# 39 for Procon Electronics



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Procon Electronics Mod-Mux$/

		m << { :name=>"HTTP Server Header" }

		# Model Detection # Page Title
		m << { :model=>@body.scan(/<title>MODBUS TCP \/ ([^\s]+) Converter<\/title>/)[0][0] } if @body =~ /<title>MODBUS TCP \/ ([^\s]+) Converter<\/title>/

	end

	# Return passive matches
	m
end
end

