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
description "Oracle-iPlanet Web Server and Proxy Server."
website "http://www.oracle.com/technetwork/middleware/iplanetwebserver-098726.html"

# ShodanHQ results as at 2010-10-23 #
# 277 for Proxy-agent:iPlanet-Web-Proxy-Server
#  62 for Server:iPlanet-Web-Server
#  51 for Server:Oracle-iPlanet-Web-Server
#   8 for for Server:iPlanet-WebServer-Enterprise



# Matches #
matches [

# HTTP Header # Proxy-Agent # Version Detection
{ :search=>"headers[proxy-agent]", :version=>/iPlanet-Web-Proxy-Server\/([\d\.]+)/, :module=>"Proxy" },

# HTTP Header # Server # Version Detection
{ :search=>"headers[server]", :version=>/iPlanet-WebServer-Enterprise\/([\d\.]+)/, :module=>"Web" },
{ :search=>"headers[server]", :version=>/Oracle-iPlanet-Web-Server\/([\d\.]+)/, :module=>"Web" },

]

end

