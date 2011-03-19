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

# Examples #
examples %w|
61.74.112.248
61.74.20.54
61.79.220.240
61.79.221.13
61.79.221.54
61.82.125.187
125.138.64.143
211.104.128.99
211.217.175.233
211.222.98.204
218.147.109.65
218.147.129.195
220.117.18.96
221.165.94.20
222.102.108.85
222.103.171.169
222.103.200.36
222.103.245.246
222.103.245.59
222.103.245.95
222.104.193.246
222.104.204.125
222.117.209.151
222.117.232.140
222.117.249.40
222.117.252.23
222.117.26.52
222.117.39.37
222.117.7.5
222.117.78.145
222.117.82.97
222.119.120.121
222.119.192.147
|

# Matches #
matches [


# HTML
{ :certainty=>75, :status=>401, :text=>'<HTML> <Title> 401 unAuthorized </title>                   <body> <H1> 401 unauthorized request </H1></body>                   </HTML>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @status == 401 and @meta["www-authenticate"] =~ /^Basic realm="System Login"$/ and @meta["server"] == "httpd" and @body =~ /^<HTML> <Title> 401 unAuthorized <\/title>                   <body> <H1> 401 unauthorized request <\/H1><\/body>                   <\/HTML>$/

		m << { :name=>"WWW-Authenticate Realm, HTTP Server and HTML" }

	end

	# Return passive matches
	m

end

end

