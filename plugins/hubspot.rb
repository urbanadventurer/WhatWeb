##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# add website
##
Plugin.define do
name "HubSpot"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "HubSpot Websites"
website "https://www.hubspot.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /hsPagesViewedThisSession/, :name=>"hsPagesViewedThisSession cookie" },
	
] 

end
