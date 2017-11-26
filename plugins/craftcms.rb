##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Added website. Cleaned up
##
Plugin.define do
name "CraftCMS"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
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
