##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Varnish"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-15
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.2 # 2016-08-19 # Added cookie
]
version "0.2"
description "Varnish is an HTTP accelerator written in C designed for content-heavy dynamic web sites. In contrast to other HTTP accelerators, such as Squid, which began life as a client-side cache, or Apache, which is primarily an origin server, Varnish was designed from the ground up as an HTTP accelerator."
website "http://www.varnish-cache.org/"

# ShodanHQ results as at 2011-04-15 #
# 14,040 for X-Varnish

matches [

	{ :search => "headers[x-varnish]", :regexp => //, :name=>"x-varnish header" },

	{ :search => "headers[server]", :regexp => /^Varnish$/, :name=>"Varnish Server Header" },

	# Cookie
	{ :search => "headers[set-cookie]", :regexp => /ENUnique/, :name=>"ENUnique cookie" },

]

end

