###
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
#
##
Plugin.define do
name "WordFence"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
]
version "0.1"
description "WordFence Wordpress Security Plugin"
website "http://www.WordFence.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^wfvt_/, :name=>"wfvt_ cookie" },
	
] 

end
