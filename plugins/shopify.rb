##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Shopify"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Updated description and added website. 
]
version "0.2"
description "Shopify CMS and ecommerce platform."
website "http://shopify.com/"

# Matches #
matches [

{ :text => '<a target="_blank" class="ico ico-shopify-bag" href="//www.shopify.com">
        <span class="helper--visually-hidden">Shopify.com</span>
</a>', :name => "Admin-Login-Page"},

	
	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /_secure_session_id/, :name=>"_secure_session_id cookie" },
	{ :search => "headers[set-cookie]", :regexp => /_session_id/, :name=>"_session_id cookie" },
	{ :search => "headers[set-cookie]", :regexp => /cart_sig/, :name=>"cart_sig cookie" },
	{ :search => "headers[set-cookie]", :regexp => /customer_sig/, :name=>"customer_sig cookie" },
	{ :search => "headers[set-cookie]", :regexp => /secure_customer_sig/, :name=>"secure_customer_sig cookie" },
	
] 

end
