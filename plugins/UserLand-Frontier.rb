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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^UserLand Frontier/

		# Server Detection
		m << { :name=>"HTTP Server Header" }

		# Version & OS Detection
		if @headers["server"] =~ /^UserLand Frontier\/([^-]+)-(.+)$/

			match=@headers["server"].scan(/^UserLand Frontier\/([^-]+)-(.+)$/)

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

