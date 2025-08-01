##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Microsoft-Azure"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Add website. Tidy..
  "Andrew Horton", # v0.3 # 2025-08-02 # Added Azure-specific header detection
]
version "0.3"
description "Microsoft Azure is a cloud computing platform for building, deploying, and managing applications and services through Microsoft-managed data centers."
website "https://azure.microsoft.com/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /ARRAffinity/, :name=>"ARRAffinity cookie" },
	{ :search => "headers[set-cookie]", :regexp => /WAWebSiteSID/, :name=>"WAWebSiteSID cookie" },

	# Azure-specific headers
	{ :search => "headers[x-azure-ref]", :name => "Azure Reference Header" },
	{ :search => "headers[x-msedge-ref]", :name => "MS Edge Reference Header" },
	
] 

end
