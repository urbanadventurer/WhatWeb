##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website and description
##
Plugin.define do
name "WorldNow"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "WorldNow CMS. Bought and rebranded by Frankly in 2015."
website "http://franklyinc.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^wn_cg/, :name=>"wn_cg cookie" },
	
] 

end
