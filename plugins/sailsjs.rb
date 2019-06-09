##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SailsJS"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Add website and update description. 
]
version "0.2"
description "SailsJS is a realtime MVC Framework for Node.js"
website "https://sailsjs.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^sails.sid/, :name=>"sails.sid cookie" },
	
] 

end
