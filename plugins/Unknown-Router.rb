##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-05-30 #
# Updated regex
##
# Version 0.3 # 2011-03-02 #
# Removed false positives
##
# Version 0.2 # 2011-01-09 #
# Updated model detection
##
Plugin.define "Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-03
version "0.4"
description "This plugin identifies routers for which the vendor is unknown or where fingerprinting is exceptionally difficult."



# Matches #
matches [

# Arris Touchstone Device # Default Favicon
{ :model=>'Arris Touchstone Device', :url=>"/favicon.ico", :md5=>"a8fe5b8ae2c445a33ac41b33ccc9a120" },

# ST 605 # Default Favicon
{ :model=>'ST 605', :url=>"/favicon.ico", :md5=>"d16a0da12074dae41980a6918d33f031" },

# Unknown Router # Login page
{ :md5=>"d8d705cef8dbf67357ee908f42fd1baa", :url=>"/favicon.ico" },
{ :md5=>"129f914b2570b50374ebeb8f1306617d", :url=>"/login/keys.png" },

]

# Passive #
def passive
	m=[]

	# About 62 ShodanHQ results for WWW-Authenticate: Basic realm="LOGIN Enter Password (default is private)"
	# Probably D-Link # HTTP Server Header and WWW-Authenticate Realm
	if @headers["server"] =~ /Boa\/[\d\.]+ \(with Intersil Extensions\)/ and @headers["www-authenticate"] =~ /Basic realm="LOGIN Enter Password \(default is private\)"/
		m << { :certainty=>25, :model=>"D-Link", :name=>"HTTP Server Header and WWW-Authenticate Realm" }
	end

	# Unknown Router 0001 # Check HTTP Server Header
	# 3020 ShodanHQ results for set-cookie: niagara_audit=guest; path=/
	if @headers["server"] =~ /Niagara Web Server\/([\d\.]+)/
		m << { :certainty=>75, :name=>"niagara_audit=guest Cookie" } if @headers["set-cookie"] =~ /niagara_audit=guest; path=\//
	end

	# Unknown Router 0002 # ADSL2+ # HTTP Server and WWW Authenticate Realm
	# 3361 ShodanHQ results for Server: RomPager WWW-Authenticate: Basic realm="Default Admin.= admin/admin"
	# Find model info: /status/status_deviceinfo.htm
	if @headers["www-authenticate"] =~ /Basic realm="Default Admin.= admin\/admin"/ and @headers["server"] =~ /RomPager/i
		m << { :certainty=>25, :model=>"ADSL2+" }
	end

	# HTTP Server Header # 320 ShodanHQ results for thttpd-alphanetworks
	# Alpha Networks was founded as a spin-off from the D-Link Corporation
	# thttpd-alphanetworks is used by D-Link & Planex routers + others
	if @headers["server"] =~ /^thttpd-alphanetworks\/([\d\.]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^thttpd-alphanetworks\/([\d\.]+)$/) }

		# Model Detection
		m << { :model=>@headers["www-authenticate"].scan(/Basic realm="([^\s^"]+)"/) } if @headers["www-authenticate"] =~ /Basic realm="([^\s^"]+)"/

	end

	# Return passive matches
	m
end

end

