##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-Adaptive-Security-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-11
version "0.1"
description "The Cisco Adaptive Security Appliance (ASA) family of security devices protects corporate networks. It provides users with highly secure access to data - anytime, anywhere, using any device."
website "http://www.cisco.com/web/ANZ/products/security/asa_software.html"

# ShodanHQ results as at 2012-11-11 #
# 226 for Adaptive Security Appliance

# Google results as at 2012-11-11 #
# 33 for intitle:"Cisco Systems" "Network User Authentication is required"
# 26 for inurl:"netaccess/redirect.html?sid"
#  1 for intitle:"Cisco Systems" "User Authentication is not required" inurl:"netaccess/connstatus.html"

# Dorks #
dorks [
'intitle:"Cisco Systems" "Network User Authentication is required"'
]



# Matches #
matches [

# Title
{ :text=>'<title>Cisco Systems, Inc. Network Access</title>', :certainty=>75 },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Adaptive Security Appliance HTTP\/1\.1$/ },

# /netaccess/redirect.html # Form
{ :regexp=>/<FORM ACTION="\/netaccess\/redirect\.html">\s+<INPUT type=hidden name=sid VALUE=/ },

]

end

