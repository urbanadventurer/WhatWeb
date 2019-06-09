##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "BigCommerce"
authors [
  "Claudio Salazar <csalazar at spect dot cl>",
  "Bhavin Senjaliya", # v0.2 # 2016-08-19 #  Add 3 cookies
  "Andrew Horton", # v0.3 # 2017-11-27 # Update website and adjust certainty. 
]
version "0.3"
description "Fully loaded with killer features."
website "http://www.bigcommerce.com/"

matches [
	{
	:name=>"iselector.css is a common file in BigCommerce systems",
	:regexp=>/\/iselector.css/, :certainty => 25 },

	#Common variables
	{ :regexp=>/config.ShopPath = /, :certainty => 25},
	{ :regexp=>/config.AppPath = /, :certainty => 25},

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^fornax_anonymousId/, :name=>"fornax_anonymousId cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^RECENTLY_VIEWED_PRODUCTS/, :name=>"RECENTLY_VIEWED_PRODUCTS cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^SHOP_SESSION_TOKEN/, :name=>"SHOP_SESSION_TOKEN cookie" },

]

end
