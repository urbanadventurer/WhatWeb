##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2017-11-27 # Andrew Horton
# Add website and update description
##
#
Plugin.define do
name "BadBehaviourAntiSpamPlugin"
author "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>" # 2016-08-19
version "0.2"
description "Bad Behaviour Anti-Spam Plug-in that supports many PHP projects including phpBB, MediaWiki and Wordpress."
website "http://bad-behavior.ioerror.us/"

# Matches #
matches [

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /bb2_screener_/, :name=>"bb2_screener_ cookie" },
	
] 

end
