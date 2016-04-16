##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tiger-IP-Connect" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-30
version "0.1"
description "Tiger IP Connect - is a Windows based software solution to manage a single Nomadix powered Hot-Spot."
website "http://www.tigercomms.com/tiger-ip-connect-lite"

# ShodanHQ results as at 2012-04-30 #
# 389 for Location network/index.php
#  28 for Symantec Gateway Security

# Google results as at 2012-04-30 #
# 8 for intitle:"Tiger IP Connect" intitle:Login "Login"

# Dorks #
dorks [
'intitle:"Tiger IP Connect" intitle:Login "Login"'
]



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

