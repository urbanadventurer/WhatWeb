##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Fusion-Middleware" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-23
version "0.1"
description "Oracle Fusion Middleware (OFM) - Homepage: http://www.oracle.com/au/products/middleware/index.html"
# More Info # http://en.wikipedia.org/wiki/Oracle_Fusion_Middleware

# ShodanHQ results as at 2012-07-23 #
# 24 for Oracle Fusion Middleware

# Examples #
examples %w|
91.211.156.18
203.166.160.65
91.194.86.50
187.72.169.16
187.72.169.15
200.198.216.16
200.198.216.17
200.198.216.10
187.72.169.17
bic2g.oracle.com
fed.metropcs.com
hrisssopub.asmnet.com
a1bowling.net
www.sandiegoilead.com
www2.wou.edu
myclubmobile.com
inforep.mram.gov.mn
securedb.fsec.ucf.edu
https://misterimporter.com/
|

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

