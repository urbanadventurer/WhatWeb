##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BEA-WebLogic-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-14
version "0.1"
description "BEA WebLogic Server is an enterprise-ready Java EE application server that supports the deployment of mission-critical applications in a robust, secure, highly available, and scalable environment. - Homepage: http://download.oracle.com/docs/cd/E13222_01/wls/docs100/index.html"

# ShodanHQ results as at 2011-09-14 #
# 2,000 for WebLogic
#    98 for WebLogic Temporary Patch

# Google results as at 2011-09-14 #
# 26 for intitle:"Default BEA WebLogic Server Web Server Index Page"

# Dorks #
dorks [
'intitle:"Default BEA WebLogic Server Web Server Index Page"'
]

# Examples #
examples %w|
203.66.215.48
203.247.133.195
218.25.90.48
124.81.94.72
212.31.38.11
202.84.17.66
218.200.243.54
213.139.126.218
196.8.101.86
12.8.16.37
83.224.65.191
210.160.58.51
218.8.245.10:7777
94.228.185.254
lab1.skybridgeglobal.com:9800
fsportalservers.ucr.edu
https://pshrwb200.jcpenney.com:7401/
https://cityjobs.sanjoseca.gov/
https://pacus.theamericancollege.edu/
|

# Matches #
matches [

# Title
{ :text=>'<title>Default BEA WebLogic Server Web Server Index Page</title>' },
{ :text=>'<TITLE>Default BEA WebLogic Server Web Server Index Page</TITLE>' },

# Version Detection # Heading
{ :version=>/<h1>BEA WebLogic Server ([^\s]+)&#153;<\/h1>/ },

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^WebLogic( WebLogic)?( Server)? (.+)  [\d]{2}\/[\d]{2}\/[\d]{4}/, :offset=>2 },
{ :search=>"headers[server]", :version=>/^WebLogic WebLogic (Temporary .+) [\d]{2}\/[\d]{2}\/[\d]{4}/ },
{ :search=>"headers[server]", :version=>/^WebLogic Server (.+) [A-Z][a-z]{2} [A-Z][a-z]{2} [\d]{1,2} [\d]{2}:[\d]{2}:[\d]{2}/ },

]

end

