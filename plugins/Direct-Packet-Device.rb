##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Direct-Packet-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.1"
description "directPacket Research, Inc. develops and markets secure and interoperable solutions for IP voice and video communication - Secure IPC Controller / IPC Router / Secure Endpoint Manager (SEM) - Homepage: http://www.directpacket.com/"

# ShodanHQ results as at 2011-03-08 #
# 31 for DPWebServer
# All results are from United States



# Matches #
matches [

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"ee6371b0db9369cf5a88e552bedeed19" },

# body HTML
{ :text=>'<body bgcolor=#efefef link=# vlink=# text=#3f3f3f background=  >' },

# Password HTML
{ :text=>'<td height="30" class="login"><b><font color="ffffff" size="2" face="Arial, Helvetica, sans-serif">Password</font></b></td>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].scan(/^DPWebServer\/([\d\.]{1,3})/) } if @headers["server"] =~ /^DPWebServer\/([\d\.]{1,3})/

	# Return passive matches
	m
end

end


