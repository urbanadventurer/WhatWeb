##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website and updated description
##
Plugin.define do
name "TeaLeaf"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "Tealeaf is a Customer Experience Management system now owned by IBM."
website "https://www.ibm.com/customer-engagement/tealeaf"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^TLTSID/, :name=>"TLTSID cookie" },
	{ :search => "headers[set-cookie]", :regexp => /^TLTUID/, :name=>"TLTUID cookie" },
	
] 

end
