##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Google-Analytics"
authors [
  "Peter van der Laan",
]
version "0.1"
description "This plugin identifies the Google Analytics account."
website "http://www.google.com/analytics/"

# Matches #
matches [

	# Google Analytics
	# String:  _gaq.push(['_setAccount', 'UA-12345678-1']);
	# String:  _gaq.push(['_setAccount', 'UA-1234567-12']);
	{ :account=>/_gaq.push\(\['_setAccount',[\s]*'(\w{2}-\d{1,}-\d{1,})'\]/},

	# New Google Universal Analytics
	# String : ga('create', 'UA-12345678-1', 'example.com');
	# String : ga('create', 'UA-1234567-12', 'example.com');
	{ :version=>"Universal", :account=>/ga\([\s]*'create',[\s]*'(\w{2}-\d{1,}-\d{1,})',/},

	# Added by ippolito 2021-10-19
	{ :regexp=>/[^a-zA-Z\d_\-\.](gtag\.js|analytics\.js)/, :version=>"Universal"},
	{ :regexp=>/[^a-zA-Z\d_\-\.]ga\.js/, :version=>"Classic"},
	{ :account=>/<script .*src="https:\/\/www.googletagmanager.com\/gtag\/js?.*id=(\w{2}-\w{1,}-\d{1,})"/}
]

end

