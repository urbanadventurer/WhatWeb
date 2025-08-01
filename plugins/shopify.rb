##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Shopify"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Updated description and added website.
  "Andrew Horton", # v0.3 # 2025-08-02 # Added Shopify-specific header detection.
]
version "0.3"
description "Shopify is an e-commerce platform that allows individuals and businesses to create online stores."
website "https://www.shopify.com/"

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

	# Shopify-specific headers
	{ :search => "headers[shopify-edge-ip]", :name => "Shopify Edge IP header" },
	{ :search => "headers[x-shopify-stage]", :name => "Shopify Stage Environment" },
	{ :search => "headers[x-sorting-hat-podid]", :name => "Shopify Pod ID" },
	{ :search => "headers[x-shopify-api-version]", :name => "Shopify API Version" },
	{ :regexp => /<meta name="shopify-digital-wallet"/i, :name => "Shopify Digital Wallet Meta Tag" },
	
] 

end
