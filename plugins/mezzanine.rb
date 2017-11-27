##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
# Version 0.2 # 2017-11-27 # Andrew Horton
# Add website, description.
#
Plugin.define do
name "Mezzanine"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "Mezzanine is a CMS built using Django."
website "http://mezzanine.jupo.org/"

# Matches #
matches [

	# Cookie 
	{ :regexp => /mezzanine_login_interface/, :name=>"Admin Login Page " },
	
] 

end
