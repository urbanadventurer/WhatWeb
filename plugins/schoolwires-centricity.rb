##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website, updated description, adjusted certainty
##
Plugin.define do
name "SchoolWire-Centricity"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
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
