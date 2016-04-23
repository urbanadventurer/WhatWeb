##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "NetVehicle" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.2"
description "Fujitsu NetVehicle router [Japanese]"
website "http://fenics.fujitsu.com/products/netvehicle/"

# ShodanHQ results as at 2011-03-08 #
# 9 for NetVehicle



# Matches #
matches [

# Default Title
{ :text=>"<HEAD><TITLE>Welcome to NetVehicle</TITLE></HEAD>" },

# Logo
{ :url=>"/nv_logo.gif", :md5=>"efff3142fb8f4e34836ca5b38ca40512" },

# HTTP Server Header
{ :regexp=>/^NetVehicle/, :search=>"headers[server]" },

# Model Detection
{ :model=>/^NetVehicle-([A-Z\d]{1,3})/, :search=>"headers[server]" },

]

end


