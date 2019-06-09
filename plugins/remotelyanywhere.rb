##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RemotelyAnywhere"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-08 #
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "A small HTTP daemon, which enables you to access and manage services, processes, users, and files on the remote computer over the network."
website "http://www.remotelyanywhere.com/"

# ShodanHQ results as at 2011-04-08 #
# 213 for RemotelyAnywhere

matches [
	# HTTP Server Header
	{ :regexp=>/^RemotelyAnywhere/, :search=>"headers[server]" },

	# Version Detection # HTTP Server Header
	{ :version=>/^RemotelyAnywhere\/([\d\.]+)$/, :search=>"headers[server]" },

]

end

