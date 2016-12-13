##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Visec" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-05
version "0.1"
description "Visec - Surveillance Software"
website "http://www.visec.net/"

# ShodanHQ results as at 2012-06-05 #
# 38 for visec

# Google results as at 2012-06-05 #
# 1 for intitle:"VISEC - Login" "Please enter a password to log into VISEC"

# Dorks #
dorks [
'intitle:"VISEC - Login" "Please enter a password to log into VISEC"'
]



# Matches #
matches [

# HTML Comments
{ :regexp=>/<!--wml-->\s+<!--bad-->/ },

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"2e5e985fe125e3f8fca988a86689b127" },

# Server # Version Detection
{ :search=>"headers[server]", :version=>/^VISEC\/([^\s]+)$/ },

]

end

