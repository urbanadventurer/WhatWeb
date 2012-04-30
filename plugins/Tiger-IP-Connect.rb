##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tiger-IP-Connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-30
version "0.1"
description "Tiger IP Connect - is a Windows based software solution to manage a single Nomadix powered Hot-Spot. - Homepage: http://www.tigercomms.com/tiger-ip-connect-lite"

# ShodanHQ results as at 2012-04-30 #
# 389 for Location network/index.php
#  28 for Symantec Gateway Security

# Google results as at 2012-04-30 #
# 8 for intitle:"Tiger IP Connect" intitle:Login "Login"

# Dorks #
dorks [
'intitle:"Tiger IP Connect" intitle:Login "Login"'
]

# Examples #
examples %w|
213.0.113.114
203.162.45.183
115.248.70.188
78.154.112.123
zux006-053-009.adsl.green.ch
81-18-200-30.static.chello.pl
193.86.76.178
195.18.109.179
190.0.47.250
190.128.135.94
196.201.199.155
82.111.117.83
217.156.150.101
212.250.5.206
213.42.182.199
217.89.125.34
213.224.3.250
94.30.85.24
217.89.125.120
109.170.135.19
|

# Matches #
matches [

# HTTP Location Header # network/index.php 
{ :certainty=>75, :search=>"headers[location]", :regexp=>/^network\/index\.php$/ },

# Login Page # Version Detection # Title
{ :version=>/<title>Tiger IP Connect ([^\s]+) -  Login<\/title>/ },

# Login Restricted Message
{ :text=>'<td align="center" bgcolor="#FFCC00"><b>Login is disabled from this IP address.</b></td>' },

# /include/tiger.css
{ :url=>"/include/tiger.css", :text=>'background-image:url(../images/tiger/subTabmidden.gif);' },

# TigerTMS # StyleSheet
{ :text=>'<link rel="stylesheet" href="/include/tms.css">', :string=>"TigerTMS" },

# Firedigit # StyleSheet
{ :text=>'<link rel="stylesheet" href="/include/firedigit.css">', :string=>"Firedigit" },

]

end

