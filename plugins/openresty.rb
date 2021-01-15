##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "OpenResty"
	authors [
		"Andrew Horton", # v0.1 # 2021-01-16 # Created plugin
	]
	version "0.1"
	description "OpenResty® is a dynamic web platform based on NGINX and LuaJIT."
	website "https://openresty.org/"

	# Dorks # 
	dorks [
	'"If you see this page, the OpenResty web platform is successfully installed"',
	]

	# Matches #
	matches [
		# Default install page
		{ :text => "If you see this page, the OpenResty web platform is successfully installed and working" },

		# Default 404 page
		{ :regexp => /<hr><center>openresty<\/center>\s*<\/body>\s*<\/html>/ },

		# HTTP Server header
		{ :search => "headers[server]", :version => /^openresty\/(.*)/ }
	]
end
