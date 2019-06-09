##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "NetSuite"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Add website and description. 
]
version "0.2"
description "NetSuite has a range of products. I don't know what this detects."
website "http://www.netsuite.com/portal/home.shtml"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^NLSD3/, :name=>"NLSD3 cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^NS_ROUTING_VERSION/, :name=>"NS_ROUTING_VERSION cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^NS_VER/, :name=>"NS_VER cookie" },
	
] 

end
