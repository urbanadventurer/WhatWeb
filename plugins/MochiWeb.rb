##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-21 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "MochiWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-21
version "0.2"
description "MochiWeb is an Erlang library for building lightweight HTTP servers. WebMachine is a REST-based system for building web applications on top of the bit-pushing and HTTP syntax-management provided by MochiWeb, and provides a simple and clean way to connect that to your application's behavior. - Homepages: https://github.com/mochi/mochiweb - https://bitbucket.org/justin/webmachine/wiki/Home"

# ShodanHQ results as at 2011-06-21 #
# 190 for MochiWeb
# 155 for MochiWeb -WebMachine

matches [
	# HTTP Server Header
	{ :regexp=>/^MochiWeb/, :search=>"headers[server]" },
	# Version Detection
	{ :version=>/^MochiWeb\/([^\s]+)/, :search=>"headers[server]" },
	# Version Detection # WebMachine Module
	{ :module=>/^MochiWeb.*(WebMachine\/[^\s]+)/, :search=>"headers[server]" },

]


end

