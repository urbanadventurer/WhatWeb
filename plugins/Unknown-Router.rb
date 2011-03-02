##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-02 #
# Removed false positives
##
# Version 0.2 # 2011-01-09 #
# Updated model detection
##
Plugin.define "Unknown-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-03
version "0.3"
description "This plugin identifies routers for which the vendor is unknown or where fingerprinting is exceptionally difficult."

# Examples #
examples %w|
80.179.16.172
212.143.118.102
82.35.80.76
95.87.199.169
81.104.44.67
82.39.102.142
95.87.212.11
88.199.139.144
95.87.196.252
95.87.203.247
83.89.21.117
81.18.75.138
12.50.82.185
65.103.138.230
70.148.255.88
74.204.63.227
134.29.214.66
173.14.85.126
201.151.198.125
208.90.101.48
216.1.6.199
|

# Matches #
matches [

# Arris Touchstone Device # Default Favicon
{ :model=>'Arris Touchstone Device', :url=>"/favicon.ico", :md5=>"a8fe5b8ae2c445a33ac41b33ccc9a120" },

# ST 605 # Default Favicon
{ :model=>'ST 605', :url=>"/favicon.ico", :md5=>"d16a0da12074dae41980a6918d33f031" },

# SpeedTouch # Default Favicon
{ :model=>'SpeedTouch', :url=>"/favicon.ico", :md5=>"befcded36aec1e59ea624582fcb3225c" },

# i3micro VRG # Default Favicon
{ :model=>'i3micro VRG', :url=>"/favicon.ico", :md5=>"e4a509e78afca846cd0e6c0672797de5" },

# Unknown Router 0001 # Login page # Default favicon
{ :md5=>"d8d705cef8dbf67357ee908f42fd1baa", :url=>"/favicon.ico" },

# Unknown Router 0001 # Login page # Default image
{ :md5=>"129f914b2570b50374ebeb8f1306617d", :url=>"/login/keys.png" },

]

# Passive #
def passive
	m=[]

	# About 62 ShodanHQ results for WWW-Authenticate: Basic realm="LOGIN Enter Password (default is private)"
	# Probably D-Link # HTTP Server Header and WWW-Authenticate Realm
	m << { :model=>"Probably D-Link", :name=>"HTTP Server Header and WWW-Authenticate Realm", :status=>401 } if @meta["server"] =~ /Boa\/[\d\.]+ \(with Intersil Extensions\)/ and @meta["www-authenticate"] =~ /Basic realm="LOGIN Enter Password (default is private)"/

	# Unknown Router 0001 # Check HTTP Server Header
	# 3020 ShodanHQ results for set-cookie: niagara_audit=guest; path=/
	if @meta["server"] =~ /Niagara Web Server\/([\d\.]+)/
		m << { :name=>"niagara_audit=guest Cookie" } if @meta["set-cookie"] =~ /niagara_audit=guest; path=\//
	end

	# Unknown Router 0002 # ADSL2+ # HTTP Server and WWW Authenticate Realm
	# 3361 ShodanHQ results for Server: RomPager WWW-Authenticate: Basic realm="Default Admin.= admin/admin"
	# Find model info: /status/status_deviceinfo.htm
	m << { :model=>"ADSL2+" } if @meta["www-authenticate"] =~ /Basic realm="Default Admin.= admin\/admin"/ and @meta["server"] =~ /RomPager/i

	m

end

end

