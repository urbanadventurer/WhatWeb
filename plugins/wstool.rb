##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WSTOOL" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-09
version "0.1"
description "WSTOOL is OS-independence Web vulnerability scanner"
website "http://wstool.sourceforge.net/"

# Google results as at 2012-01-09 #
# 1 for intitle:"Server Error & SQL Injection Sacnner" "Server info" "Domain or IP"

# Dorks #
dorks [
' intitle:"Server Error & SQL Injection Sacnner" "Server info" "Domain or IP"'
]



# Matches #
matches [

# Homepage Link # Version Detection
{ :version=>/<a href="http:\/\/sourceforge\.net\/projects\/wstool" target="_blank">Server Error & SQL Injection Sacnner \(Ver ([^\s^\)]+)\)<\/a>/ },

# Title # Version Detection
{ :version=>/<title>Server Error & SQL Injection Sacnner \(Ver ([^\s^\)]+)\)<\/title>/ },

]

end

