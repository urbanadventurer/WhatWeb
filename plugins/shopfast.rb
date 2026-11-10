##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ShopFast"
authors [
  "anurag12340", # 2026-11-10
]
version "0.1"
description "ShopFast is a hosted ecommerce platform for selling digital products. Stores are served on <handle>.shopfa.st subdomains or on custom domains."
website "https://shopfa.st/"

# Matches #
matches [

	# Storefront runtime script, on every store page: /_sf/runtime.<12 hex build hash>.js
	{ :regexp => /<script type="module" src="\/_sf\/runtime\.[0-9a-f]{12}\.js"><\/script>/, :name => "Storefront runtime script" },

	# Page type meta tag, on every store page
	{ :regexp => /<meta name="sf:page-type" content="[a-z0-9-]+"/, :name => "sf:page-type meta tag" },

	# Loading-skeleton manifest, on every store page
	{ :text => '<script type="application/json" id="sf-skeletons">', :name => "sf-skeletons manifest" },

	# Store images served from ShopFast's media host
	{ :regexp => /<img[^>]+src="https:\/\/media\.shopfa\.st\/public\//, :name => "media.shopfa.st image" },

	# Optional "Powered by ShopFast" footer badge (paid plans can hide it)
	{ :regexp => /<a class="sf-powered" href="https:\/\/shopfa\.st\/\?/, :name => "Powered by ShopFast badge" },

]

end
