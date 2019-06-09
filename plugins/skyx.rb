##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SkyX"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-30
  "Andrew Horton", # v0.2 # 2016-04-23 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "The Mentat SkyX series were designed for TCP acceleration/compression and high latency link optimization. Mentat was acquired by Packeteer in 2004. Packeteer was acquired by Blue Coat Systems in 2008 and the SkyX series was discontinued"
website "http://www.bluecoat.com/"

# More Info #
# http://www.bluecoat.com/landing/packeteer-end-life-matrix
# http://en.wikipedia.org/wiki/Packeteer

# ShodanHQ results as at 2011-05-30 #
# 63 for SkyX HTTPS



# Matches #
matches [

# div id="skyx_status"
{ :text=>'<div id="skyx_status">SkyX status: enhancing</div>' },

# JavaScript # /skyxgui.js
{ :text=>'<script language="javascript" type="text/javascript" src="/skyxgui.js"></script>' },

# Hostname Detection
{ :string=>/<div id="hostname"><a href="Misc">Hostname<\/a>: ([^\s^<]+)<\/div>/ },

# HTTP Server Header
{ :regxp=>/^SkyX /, :search=>"headers[server]" },

# Version Detection
{ :version=>/^SkyX HTTPS ([^\s]+)$/, :search=>"headers[server]" },

]

# Passive #
passive do
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^SkyX /

		# Model Detection
		m << { :model=>@body.scan(/<div id="model">Model:([^<]+)<\/div>/) } if @body =~ /<div id="model">Model:([^<]+)<\/div>/

	end

	# Return passive matches
	m
end

end

