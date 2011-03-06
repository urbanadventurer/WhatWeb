##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-25 #
# Updated regex
##
Plugin.define "KaZaA" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.2"
description "This plugin retrieves the KaZaA IP:port combination, network and username from the HTTP headers."

# About 74 ShodanHQ results for X-Kazaa-Username
# About 112 ShodanHQ results for X-Kazaa-Network

# Examples #
examples %w|
67.240.153.145
76.97.90.33
98.235.134.5
|

# Passive #
def passive
	m=[]

	# X-Kazaa-IP
	m << { :string=>@meta["x-kazaa-ip"] } unless @meta["x-kazaa-ip"].nil?

	# X-Kazaa-Network
	m << { :module=>@meta["x-kazaa-network"] } unless @meta["x-kazaa-network"].nil?

	# X-Kazaa-Username
	m << { :account=>@meta["x-kazaa-username"] } unless @meta["x-kazaa-username"].nil?

	# Return passive matches
	m

end

end

