##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SiteCore"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Updated description. Added website.. 
]
version "0.2"
description "Sitecore a .NET CMS, ecommerce, and digital marketing platform."
website "http://www.sitecore.net/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^SC_ANALYTICS_/, :name=>"SC_ANALYTICS_ cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^sc_expview/, :name=>"sc_expview cookie" },
	
] 

end
