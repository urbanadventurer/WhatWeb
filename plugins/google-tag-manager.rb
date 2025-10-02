##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Google-Tag-Manager"
authors [
  "Michael Ippolito"
]
version "0.1"
description "This plugin identifies Google Tag Manager."
website "http://www.google.com/tagmanager/"

# Matches #
matches [

	# Added by ippolito 2021-10-19
	{ :regexp=>/[^a-zA-Z\d_\-\.]gtag\.js/, :account=>/<script .*src="https:\/\/www.googletagmanager.com\/gtag\/js?.*id=(\w{2}-\w{1,}-\d{1,})"/},
	{ :regexp=>/<!-- Google Tag Manager -->/},
	{ :regexp=>/https:\/\/www\.googletagmanager\.com\/gtm\.js/}

]

end

