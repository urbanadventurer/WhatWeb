##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "UserLand-Frontier" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The UserLand Frontier Kernel is a powerful development platform including an integrated object database, scripting language, a script editor and debugger, outliner, a multi-threaded runtime and an integrated HTTP server. In addition to being a powerful content management system, thru the Website Framework, Frontier is also a standard HTTP 1.1 server, allowing for a smooth and high-level connection between web browsers and content that's rendered thru templates and with macros. - Homepage: http://frontier.userland.com/"

# ShodanHQ results as at 2011-03-14 #
# 127 for UserLand Frontier

# Examples #
examples %w|
65.18.26.14
203.86.194.6
62.54.132.44
212.23.192.69
159.54.62.89
150.160.254.70
74.94.69.215
193.197.168.162
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^UserLand Frontier/

		# Server Detection
		m << { :name=>"HTTP Server Header" }

		# Version & OS Detection
		if @meta["server"] =~ /^UserLand Frontier\/([^-]+)-(.+)$/

			match=@meta["server"].scan(/^UserLand Frontier\/([^-]+)-(.+)$/)

			# Version Detection
			m << { :version=>match[0][0] }

			# OS Detection
			m << { :os=>match[0][1] }

		end

	end

	# Return passive matches
	m

end

end

