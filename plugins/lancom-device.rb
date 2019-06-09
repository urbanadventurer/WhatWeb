##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "LANCOM-Device"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-02
  "Andrew Horton", # v0.2 # 2016-04-21 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "LANCOM Systems is a provider of innovative and reliable communications solutions, Secure Access, VPN and Wireless LAN with high technological capabilities, easy configuration and unified control of all products."
website "http://www.lancom-systems.nl/"

# ShodanHQ results as at 2011-06-02 #
# 32,344 for LANCOM

matches [
	# HTTP Server Header
	{ :regexp=>/^LANCOM/, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^LANCOM [^\s]+ .+ ([\d\.]+) \/ [\d]{2}\.[\d]{2}\.[\d]{4}$/, :search=>"headers[server]" },
	
	# Model Detection
	{ :model=>/^LANCOM ([^\s]+) .+ [\d\.]+ \/ [\d]{2}\.[\d]{2}\.[\d]{4}$/, :search=>"headers[server]" },
	
	# Device Detection (Wireless Router, VPN, VoIPm etc)
	{ :string=>/^LANCOM [^\s]+ (.+) [\d\.]+ \/ [\d]{2}\.[\d]{2}\.[\d]{4}$/, :search=>"headers[server]" },
]

end

