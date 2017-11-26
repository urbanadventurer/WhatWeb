##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Add website. Add moonfruit cookie.
##
Plugin.define do
name "MoonFruit"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "MoonFruit CMS"
website "https://www.moonfruit.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /markc/, :name=>"markc cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^moonfruit/, :name=>"moonfruit cookie" },
	
] 

end
