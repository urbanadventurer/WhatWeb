##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Enhydra-Application-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-20
version "0.1"
description "Enhydra Application Server"
website "http://enhydra.org/"

# More Info #
# https://en.wikipedia.org/wiki/Enhydra_Server

# ShodanHQ results as at 2012-03-20 #
# 75 for Enhydra Application Server
# 64 for Enhydra-MultiServer



# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^Enhydra-MultiServer\/([^\s]+)/ },

# Servlet-Engine # Version Detection
{ :search=>"headers[servlet-engine]", :version=>/Enhydra Application Server\/([^\s]+)/ },

]

end

