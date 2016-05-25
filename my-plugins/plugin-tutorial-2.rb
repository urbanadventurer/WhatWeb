##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
Plugin.define "Plugin-Tutorial-2" do 
author "Your preferred name <email@address>" # 1999-12-31
version "0.1"
description "GenericServer is an HTTP server for head-mounted devices that use the FOOT processor."
website "http://example.com/"

# This is the matches array. 
# Each match is treated independently.

# Matches #
matches [

	# Title
	{ :text => "<title>Welcome to GenericServer</title>" },

	# HTTP Server Header
	# This detects the presence of the text "GenericServer" within the HTTP Server header
	{ :regexp => /^GenericServer /, :search => "headers[server]" },

	# HTTP Server Header # Version Detection
	#
	# This extracts the version of the "GenericServer" from the HTTP Server header
	# Note that many HTTP servers can be configured to hide the version so there are two patterns in this plugin
	{ :version => /^GenericServer V([^\s]+)/, :search => "headers[server]" },

] 

end
