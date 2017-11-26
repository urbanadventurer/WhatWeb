##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Add website and description.
##
Plugin.define do
name "nopCommerce"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "nopCommerce is an ASP.NET based open-source ecommerce solution "
website "https://www.nopcommerce.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^Nop.customer/, :name=>"Nop.customer cookie" },
	
] 

end
