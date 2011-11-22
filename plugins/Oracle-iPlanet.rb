##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-11-22 #
# Updated matches to use matches instead of passive
##
Plugin.define "Oracle-iPlanet" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "Oracle-iPlanet Web Server and Proxy Server. - Homepage: http://www.oracle.com/technetwork/middleware/iplanetwebserver-098726.html"

# ShodanHQ results as at 2010-10-23 #
# 277 for Proxy-agent:iPlanet-Web-Proxy-Server
#  62 for Server:iPlanet-Web-Server
#  51 for Server:Oracle-iPlanet-Web-Server
#   8 for for Server:iPlanet-WebServer-Enterprise

# Examples #
examples %w|
47.234.44.129
47.234.58.33
81.209.150.32
195.55.102.7
198.246.152.165
198.246.152.101
198.246.152.102
198.246.152.103
198.246.152.104
198.246.152.105
198.246.152.106
198.246.152.107
198.246.152.108
198.246.152.109
198.246.151.173
198.246.151.174
198.246.151.175
198.246.151.176
198.246.151.177
198.246.151.178
198.246.151.179
198.246.151.196
198.246.152.102
198.246.152.207
198.246.151.208
198.246.151.219
198.246.152.165
203.106.238.115
200.38.95.69
200.38.95.100
200.38.95.150
200.38.95.177
200.38.95.192
200.38.95.194
200.38.95.216
200.38.95.227
200.38.95.235
202.187.241.236
|

# Matches #
matches [

# HTTP Header # Proxy-Agent # Version Detection
{ :search=>"headers[proxy-agent]", :version=>/iPlanet-Web-Proxy-Server\/([\d\.]+)/, :module=>"Proxy" },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/iPlanet-WebServer-Enterprise\/([\d\.]+)/, :module=>"Web" },
{ :search=>"headers[server]", :version=>/Oracle-iPlanet-Web-Server\/([\d\.]+)/, :module=>"Web" },

]

end

