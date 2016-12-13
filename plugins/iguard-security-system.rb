##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-08-05 #
# Updated http server header match
# Added www-authenticate match and google dork
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "iGuard-Security-System" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.3"
description "Lucky Technology iGuard security system, based on smart card and biometric fingerprint technology."
website "http://www.lucky-tech.com/p1.php"

# ShodanHQ results as at 2011-08-05 #
# 280 for iGuard Embedded Web Server

# Google results as at 2011-08-05 #
# 6 for "iGuard Security System" "Lucky Technology Ltd.. All rights reserved." "US Patent No.: 6,643,779"

# Dorks #
dorks [
'"iGuard Security System" "Lucky Technology Ltd.. All rights reserved." "US Patent No.: 6,643,779"'
]



# Matches #
matches [

# Default Title
{ :text=>'	<TITLE>iGuard Fingerprint Security System</TITLE>' },

# Version Detection # Meta Generator
{ :firmware=>/	<meta content="Lucky-Tech iGuard ([\d\.]{1,5})" name="GENERATOR">/ },

# Firmware Detection # /Admins/Content.vtml
{ :url=>"/Admins/Content.vtml", :firmware=>/iGuard Security[^<]+<\/td><\/tr><tr><td>Firmware Version<\/td><td>([^<]+)<\/td>/ },

# Count Users # /Admins/Content.vtml
{ :url=>"/Admins/Content.vtml", :string=>/<tr><td>Registered Automatch<\/td><td>([^<]+)<\/td><\/tr>/ },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers['server'] =~ /^iGuard Embedded Web Server\/([^\s]{1,15}) \(([^\s^\)]+)\) (SN:[^\s]+)$/
		m << { :firmware=>"#{$1}" }
		m << { :model   =>"#{$2}" }
		m << { :string  =>"#{$3}" }
	end

	# WWW-Authenticate: Basic realm="iGuard System"
	m << { :name=>"WWW-Authenticate Header" } if @headers["www-authenticate"] =~ /Basic realm="iGuard System"/

	# Return passive matches
	m
end
end

