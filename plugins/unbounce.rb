##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website and updated description.
##
Plugin.define do
name "UnBounce"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "UnBounce - Landing page system."
website "https://www.unbounce.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^ubpv/, :name=>"ubpv cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^ubvs/, :name=>"ubvs cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^ubvt/, :name=>"ubvt cookie" },
	
] 

end
