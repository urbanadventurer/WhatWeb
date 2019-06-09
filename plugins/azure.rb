##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "AzureCloud"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Add website. Tidy.. 
]
version "0.2"
description "Windows Azure cloud platform"
website "https://azure.microsoft.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /ARRAffinity/, :name=>"ARRAffinity cookie" },
	{ :search => "headers[set-cookie]", :regexp => /WAWebSiteSID/, :name=>"WAWebSiteSID cookie" },
		
] 

end
