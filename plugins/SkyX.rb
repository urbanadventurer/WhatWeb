##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SkyX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "The Mentat SkyX series were designed for TCP acceleration/compression and high latency link optimization. Mentat was acquired by Packeteer in 2004. Packeteer was acquired by Blue Coat Systems in 2008 and the SkyX series was discontinued - Homepage: http://www.bluecoat.com/"

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

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^SkyX HTTPS ([^\s]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^SkyX HTTPS ([^\s]+)$/) }

		# Model Detection
		m << { :model=>@body.scan(/<div id="model">Model:([^<]+)<\/div>/) } if @body =~ /<div id="model">Model:([^<]+)<\/div>/

	end

	# Return passive matches
	m
end

end

