##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Symfony"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-01-31
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.2 # 2016-08-19 # Added cookie and updated website
]
version "0.2"
description "Symfony - open-source PHP web framework"
website "https://symfony.com/"

# Matches #
matches [

  # GHDB Match
  { :ghdb=>'"powered by symfony"', :certainty=>25 },

  # Powered by text
  { :text=>'Powered by <a href="http://www.symfony-project.org/">' },

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^symfony/, :name=>"symfony cookie" },
	# { :search => "headers[set-cookie]", :regexp => /^SSESS/, :name=>"SSESS cookie" },
	
] 

end
