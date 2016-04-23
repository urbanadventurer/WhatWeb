##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sophos-Email-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-11
version "0.1"
description "Sophos Email Appliances provide simple, powerful protection against spam, malware and data loss."
website "http://www.sophos.com/en-us/products/email/email-appliances.aspx"

# Documentation #
# http://sea.sophos.com/docs/esa/

# ShodanHQ results as at 2012-11-11 #
# 604 for Sophos Email Appliance

# Google results as at 2012-11-11 #
# 2 for intitle:"Sophos Email Appliance" "Enter your login and password to log in."

# Dorks #
dorks [
'intitle:"Sophos Email Appliance" "Enter your login and password to log in."'
]



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Sophos Email Appliance$/ },

# HTTP to HTTPS Redirect
# Hostname Detection # sometimes discloses the internal IP/hostname
{ :search=>"headers", :string=>/[Ss]erver: Sophos Email Appliance\r?\n.+Location: https?:\/\/([^\/]+)/m },

# Login Page # Logo
{ :text=>'<td class="logincontent" valign="top"><a href="http://www.sophos.com"><img src="images/logo_sophos.gif" border="0" alt="Email Appliance"></a></td>' },

# Login Page # Title
{ :text=>'<title>Sophos Email Appliance</title>', :certainty=>75 },

# Login Page # HTML Comment
{ :text=>'<!-- end main content -->', :certainty=>25 },

]

end

