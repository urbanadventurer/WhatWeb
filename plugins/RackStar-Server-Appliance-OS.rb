##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RackStar-Server-Appliance-OS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "RackStar can be installed on almost any PC platform. That's what makes the RackStar Server Appliance Software so great! Now anyone can host sites! Still got a Cobalt RAQ? No problem! RackStar runs on that too! - homepage: http://www.rackstar.net/"

# 322 ShodanHQ results for www.rackstar.net
examples %w|
65.168.70.54
65.168.70.134
75.77.57.90
83.96.231.72
83.96.231.98
83.96.231.99
83.96.231.100
83.96.231.101
83.96.231.102
83.96.231.104
83.96.231.105
83.96.231.106
83.96.231.107
83.96.231.108
83.96.231.110
83.96.231.126
83.96.231.210
83.96.231.195
83.96.231.106
96.255.255.204
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /<A HREF='http:\/\/www.rackstar.net\/' TITLE='This server is powered by the RackStar Server Appliance OS'>RACKSTAR<\/A>/
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /\(<A HREF=http:\/\/www.rackstar.net\/>RACKSTAR<\/A>\)/

	m

end

end

