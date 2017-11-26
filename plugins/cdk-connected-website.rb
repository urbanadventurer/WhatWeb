##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Updated description. Added website. Added assets-cdk.com and x-nitra-side. Changed name.
##

Plugin.define do
name "CDK Connected Website"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "CDK creates websites for the automotive industry. CDK Connected Store is an eCommerce platform."
website "https://www.cdkglobal.com/"

# Matches #
matches [

	{ :text => 'src="https://media-cf.assets-cdk.com/', :name => "scripts from assets-cdk.com" },

	{ :search => "headers[X-Nitra-Side]", :regexp => /./},

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /^nitraside/, :name=>"nitraside cookie" },
	
] 

end
