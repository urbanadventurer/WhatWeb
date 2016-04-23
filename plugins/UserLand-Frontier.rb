##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "UserLand-Frontier" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "The UserLand Frontier Kernel is a powerful development platform including an integrated object database, scripting language, a script editor and debugger, outliner, a multi-threaded runtime and an integrated HTTP server. In addition to being a powerful content management system, thru the Website Framework, Frontier is also a standard HTTP 1.1 server, allowing for a smooth and high-level connection between web browsers and content that's rendered thru templates and with macros."
website "http://frontier.userland.com/"

# ShodanHQ results as at 2011-03-14 #
# 127 for UserLand Frontier

matches [
	# HTTP Server Header
	{ :regexp=>/^UserLand Frontier/, :name=>"HTTP Server Header", :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :version=>/^UserLand Frontier\/([^-]+)-(.+)$/, :offset=>0, :search=>"headers[server]" },

	# HTTP Server Header # Version Detection
	{ :os=>/^UserLand Frontier\/([^-]+)-(.+)$/, :offset=>1, :search=>"headers[server]" },

]

end

