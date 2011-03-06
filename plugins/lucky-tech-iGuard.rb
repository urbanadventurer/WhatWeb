##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "Lucky-Tech-iGuard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.2"
description "iGuard security system, based on latest biometric fingerprint technology. - homepage: http://www.lucky-tech.com/"

# Google results as at 2010-07-18 #
# 2 results for intitle:"iGuard Fingerprint Security System"

# Examples #
examples %w|
66.208.250.26
66.208.250.26/Admins/Content.vtml
www.bionanoresearch.chem.ufl.edu
www.bionanoresearch.chem.ufl.edu/Admins/Content.vtml
|

# Matches #
matches [

# Default Title
{ :text=>'	<TITLE>iGuard Fingerprint Security System</TITLE>' },

# Version Detection # Meta Generator
{ :firmware=>/	<meta content="Lucky-Tech iGuard ([\d\.]{1,5})" name="GENERATOR">/ },

# Firmware Detection
{ :firmware=>/<td>[^<]*iGuard Security[^<]+<\/td><\/tr><tr><td>Firmware Version<\/td><td>([^<]+)<\/td>/ },

# Count Users
{ :string=>/<tr><td>Registered Automatch<\/td><td>([^<]+)<\/td><\/tr>/ },

]

# Passive #
def passive
	m=[]

	# Server: iGuard Embedded Web Server
	m << { :version=>@meta['server'].scan(/iGuard Embedded Web Server\/([^\s]{1,15})/) } if @meta['server'] =~ /iGuard Embedded Web Server\/([^\s]{1,15})/

	# Return passive matches
	m

end

end

# An aggresive plugin could get the version from /Admins/Content.vtml


