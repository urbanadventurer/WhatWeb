##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SchoolWire-Centricity"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Added website, updated description, adjusted certainty. 
]
version "0.2"
description "SchoolWire-Centricity is a CMS designed exclusively for K-12 school districts."
website "https://www.schoolwires.com/centricity2"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^SWSessionID/, :name=>"SWSessionID cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^PSDB/, :name=>"PSDB cookie", :certainty => 25 },
	{ :search => "headers[set-cookie]", :regexp => /^PSN/, :name=>"PSN cookie", :certainty => 25 },

] 

end
