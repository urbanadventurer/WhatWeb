##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "KaZaA"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-25
  # v0.2 # 2011-01-25 # Updated regex. 
]
version "0.2"
description "This plugin retrieves the KaZaA IP:port combination, network and username from the HTTP headers."

# About 74 ShodanHQ results for X-Kazaa-Username
# About 112 ShodanHQ results for X-Kazaa-Network



# Passive #
passive do
	m=[]

	# X-Kazaa-IP
	m << { :string=>@headers["x-kazaa-ip"] } unless @headers["x-kazaa-ip"].nil?

	# X-Kazaa-Network
	m << { :module=>@headers["x-kazaa-network"] } unless @headers["x-kazaa-network"].nil?

	# X-Kazaa-Username
	m << { :account=>@headers["x-kazaa-username"] } unless @headers["x-kazaa-username"].nil?

	# Return passive matches
	m

end

end

