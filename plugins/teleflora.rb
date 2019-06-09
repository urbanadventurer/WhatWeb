###
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
#
##
Plugin.define do
name "Teleflora"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
]
version "0.1"
description "Teleflora is a flower delivery service."
website "https://www.teleflora.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^sdt/, :name=>"sdt cookie" },
	
] 

end
