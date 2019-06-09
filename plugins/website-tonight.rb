##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "WebsiteTonight"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Added website and updated description. 
]
version "0.2"
description "Website Tonight CMS from GoDaddy"
website "https://www.godaddy.com/websites/website-builder"
# https://products.secureserver.net/products/website_tonight/producttourpl/index.html

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /dps_site_id/, :name=>"dps_site_id cookie" },

] 

end
