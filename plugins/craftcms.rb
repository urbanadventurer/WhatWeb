##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CraftCMS"
authors [
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # 2016-08-19
  "Andrew Horton", # v0.2 # 2017-11-27 # Added website. Cleaned up. 
]
version "0.2"
description "Craft CMS"
website "http://craftcms.com/"

# Matches #
matches [

	# HTTP Server Header
	{ :text => '<a id="poweredby" href="http://craftcms.com/" title="Powered by Craft CMS">', :name => "Admin-Login-Page"},
	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /CraftSessionId/, :name=>"CraftSessionId cookie" },
		
] 

end
