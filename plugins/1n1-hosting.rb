##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website and updated description
##
Plugin.define do
name "1&1 Hosting"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "1&1 Hosting, Domains, Website Services & Servers"
website "https://www.1and1.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /DIY_SB/, :name=>"DIY_SB cookie" },
	
] 

end
