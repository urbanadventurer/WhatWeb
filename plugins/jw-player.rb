###
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
#
##
Plugin.define do
name "JW-Player"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
]
version "0.1"
description "JW Player provides video and audio streaming"
website "https://www.jwplayer.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^SEOT/, :name=>"SEOT cookie" },
	
] 

end
