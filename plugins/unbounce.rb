##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "UnBounce"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Added website and updated description.. 
]
version "0.2"
description "UnBounce - Landing page system."
website "https://www.unbounce.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^ubpv/, :name=>"ubpv cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^ubvs/, :name=>"ubvs cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^ubvt/, :name=>"ubvt cookie" },
	
] 

end
