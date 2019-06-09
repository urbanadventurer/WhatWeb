##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "F5-BigIP"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Tidy up description. Add website.. 
]
version "0.2"
description "F5 BIG IP provides application delivery networking (ADN) technology for the delivery of web applications and the security, performance, availability of servers, data storage devices, and other network and cloud resources."
website "https://f5.com/products/big-ip"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /BIGIP/i, :name=>"BIGIP cookie" },
	{ :search => "headers[set-cookie]", :regexp => /CEBrowser/, :name=>"CEBrowser cookie" },
	{ :search => "headers[set-cookie]", :regexp => /ceSessionUID/, :name=>"ceSessionUID cookie" },
	{ :search => "headers[set-cookie]", :regexp => /LoadingAsMobile/, :name=>"LoadingAsMobile cookie" },
	{ :search => "headers[set-cookie]", :regexp => /_SitePath/, :name=>"_SitePath cookie" },
	
] 

end
