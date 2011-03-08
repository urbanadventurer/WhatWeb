##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetVehicle" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.1"
description "Fujitsu NetVehicle router [Japanese] - Homepage: http://fenics.fujitsu.com/products/netvehicle/"

# ShodanHQ results as at 2011-03-08 #
# 9 for NetVehicle

# Examples #
examples %w|
211.5.204.252
202.221.162.90
211.120.188.214
210.136.6.97
211.124.158.177
61.215.160.126
|

# Matches #
matches [

# Default Title
{ :text=>"<HEAD><TITLE>Welcome to NetVehicle</TITLE></HEAD>" },

# Logo
{ :url=>"/nv_logo.gif", :md5=>"efff3142fb8f4e34836ca5b38ca40512" },

]

# Passive #
def passive
	m=[]

	# Model Detection # HTTP Server Header
	m << { :model=>@meta["server"].scan(/^NetVehicle-([A-Z\d]{1,3})/) } if @meta["server"] =~ /^NetVehicle-([A-Z\d]{1,3})/

	# Return passive matches
	m
end

end


