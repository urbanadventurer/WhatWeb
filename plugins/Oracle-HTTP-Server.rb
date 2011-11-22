##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Oracle HTTP Server - Homepage: http://www.oracle.com/technetwork/middleware/ias/index-091236.html"
# More Info: http://en.wikipedia.org/wiki/Oracle_HTTP_Server

# ShodanHQ results as at 2011-11-22 #
# 26,456 for Oracle HTTP Server
#  5,663 for Oracle HTTP Server Powered by Apache
#     97 for Oracle_Web_Listener

# Examples #
examples %w|
205.145.2.67
87.103.238.152
193.206.192.144
84.241.128.109
203.129.124.39
221.186.174.39
194.199.210.65
61.197.159.80
91.216.23.25
84.255.213.17
203.129.124.39
210.250.152.25
12.185.110.158
165.182.254.183
32.247.13.5
200.160.247.107
207.65.70.165
66.193.105.238
210.145.136.19
204.62.19.26
|

# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/Oracle[ -]HTTP[ -]Server/ },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/Oracle_Web_[Ll]istener(_NT_)?([\d\.]+\/[^\s]+)/, :offset=>1 },
{ :search=>"headers[server]", :version=>/Oracle_Web_[Ll]istener(_NT_)?\/([^\s]+)/, :offset=>1 },

]

end

