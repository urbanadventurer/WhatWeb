##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-18 # Brendan Coles <bcoles@gmail.com>
# Updated regex
# Added HTTP Server Header match
# Added string extraction from www-authenticate realm
##
Plugin.define "WatchGuard-Firewall" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.2"
description "WatchGuard Firewall - http://www.watchguard.com/products/edge-e/overview.asp"

# ShodanHQ results as at 2011-03-18 #
# 4,976 for WatchGuard Firewall




# Passive #
def passive
	m = []

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @headers["server"] =~ /^WatchGuard Firewall$/

	# WWW-Authenticate
	m << { :name=>"WWW-Authenticate Header" } if @headers["www-authenticate"] =~ /^(Basic|Digest) realm="WatchGuard (SOHO|Firebox)/i

	# SOHO
	m << { :string=>@headers["www-authenticate"].scan(/^Digest realm="WatchGuard (SOHO [^"]+) Configuration"/) } if @headers["www-authenticate"] =~ /Digest realm="WatchGuard (SOHO [^"]+) Configuration"/

	# Firebox
	m << { :string=>"Firebox" } if @headers["www-authenticate"] =~ /^Digest realm="WatchGuard Firebox Local User"/

	# Return passive matches       
	m
end

end


