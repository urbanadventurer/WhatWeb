##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
#
Plugin.define do
	name "Plex-Media-Server"
	authors [
		"Andrew Horton", # v0.1 # 2021-03-01 # Created plugin
	]
	version "0.1"
	description "Plex Media Server (PMS) is the back-end media server component of Plex, free of charge. It organizes audio and visual content from personal media libraries and streams it to their player counterparts, either on the same machine, the same local area network, or over the Internet. It can run on Windows, macOS, Linux, FreeBSD, NAS devices, or on Nvidia Shield TV."
	website "https://www.plex.tv/"

	# Default ports 32400, 32401, 32600, 61351 according to the macOS server

	# Matches #
	matches [

	# http headers on ports 32400 and 32401
	{ :name => "X-Plex-Protocol header", :text => "", :search=>"header[X-Plex-Protocol]" },
	{ :name => "X-Plex-Content-Original-Length header", :text => "", :search=>"header[X-Plex-Content-Original-Length]" },

	# XML media tag on port 32600
	{ :name => "XML MediaGrabber tag", :text => '<MediaGrabber identifier="tv.plex.dvblex"'},

	# Aggressive version detection for port 32400
	{ :name => "Version in stylesheet filename", :version => /<link rel="stylesheet" href="\/web\/chunk-[\d]+-[a-f0-9]+-plex-([0-9\.]+)-[a-z0-9]+\.css">/, :url => "/web/index.html"}
	
	]
end
