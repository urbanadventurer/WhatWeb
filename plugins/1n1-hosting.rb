##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "1&1 Hosting"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Added website and updated description. 
]
version "0.2"
description "1&1 Hosting, Domains, Website Services & Servers"
website "https://www.1and1.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /DIY_SB/, :name=>"DIY_SB cookie" },
	
] 

end
