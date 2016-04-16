##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Fusion-Middleware" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-23
version "0.1"
description "Oracle Fusion Middleware (OFM)"
website "http://www.oracle.com/au/products/middleware/index.html"
# More Info # http://en.wikipedia.org/wiki/Oracle_Fusion_Middleware

# ShodanHQ results as at 2012-07-23 #
# 24 for Oracle Fusion Middleware



# Matches #
matches [

# Title
{ :text=>'<title>Welcome to Oracle Fusion Middleware</title>' },

# StyleSheet
{ :text=>'<link href="css/fmw_bottom_area.css" rel="stylesheet" type="text/css">' },

# div id="welcome_text" # Version Detection
{ :version=>/<div id="welcome_text">TO ORACLE<strong> FUSION MIDDLEWARE ([^\s^<]+)<\/strong> <\/div>/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Oracle-Fusion-Middleware/ },
{ :search=>"headers[server]", :version=>/^Oracle-Fusion-Middleware\/([^\s]+ \([^\)]+\))/ },

]

end

