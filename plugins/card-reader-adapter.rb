##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Card-Reader-Adapter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Card Reader Adapter - Unknown manufacturer [Korean]"
# Returns "Card Reader Adapter" over SNMP

# ShodanHQ results as at 2011-03-19 #
# 2,689 for Card Reader Adapter
# 11,361 for Basic realm "System Login" 2002
# 11,361 for Basic realm "System Login" httpd
# All results are from Korea



# Matches #
matches [


# HTML
{ :certainty=>75, :status=>401, :text=>'<HTML> <Title> 401 unAuthorized </title>                   <body> <H1> 401 unauthorized request </H1></body>                   </HTML>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @status == 401 and @headers["www-authenticate"] =~ /^Basic realm="System Login"$/ and @headers["server"] == "httpd" and @body =~ /^<HTML> <Title> 401 unAuthorized <\/title>                   <body> <H1> 401 unauthorized request <\/H1><\/body>                   <\/HTML>$/

		m << { :name=>"WWW-Authenticate Realm, HTTP Server and HTML" }

	end

	# Return passive matches
	m

end

end

