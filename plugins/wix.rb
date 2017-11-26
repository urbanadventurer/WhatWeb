##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Description and website
##
Plugin.define do
name "Wix"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "Wix is a cloud based website builder."
website "http://www.wix.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /_wixAB3/, :name=>"_wixAB3 cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^hs\s/, :name=>"hs cookie" },
	{ :search => "headers[set-cookie]", :regexp => /svSession/, :name=>"svSession cookie" },
	
] 

end
