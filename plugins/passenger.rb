##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Passenger" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-10
version "0.2"
description 'Phusion Passenger - a.k.a. mod_rails or mod_rack - makes deployment of Ruby web applications, such as those built on the revolutionary Ruby on Rails web framework, a breeze. It follows the usual Ruby on Rails conventions, such as "Dont-Repeat-Yourself""
website "http://www.modrails.com/'

# ShodanHQ results as at 2011-03-10 #
# 83,668 for Phusion_Passenger

matches [

	# Server
	{ :regexp=>/.*Phusion_Passenger/, :search=>"headers[server]" },

	# Server # Version
	{ :version=>/[\s]+Phusion_Passenger\/([\d\.]+)/, :search=>"headers[server]" },
	
	# X-Powered-By: Phusion Passenger (mod_rails/mod_rack)
	{ :version=>/Phusion Passenger \(mod_rails\/mod_rack\) ([\d\.]+)/, :search=>"headers[x-powered-by]" },

]

end


