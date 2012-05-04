##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Enhydra-Application-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-20
version "0.1"
description "Enhydra Application Server - Homepage: http://enhydra.org/"

# More Info #
# https://en.wikipedia.org/wiki/Enhydra_Server

# ShodanHQ results as at 2012-03-20 #
# 75 for Enhydra Application Server
# 64 for Enhydra-MultiServer

# Examples #
examples %w|
68.21.221.36
12.106.115.245
211.103.141.190
72.2.4.12
189.212.130.174
173.13.215.148
94.127.53.36
89.234.65.65
89.234.65.71
|

# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^Enhydra-MultiServer\/([^\s]+)/ },

# Servlet-Engine # Version Detection
{ :search=>"headers[servlet-engine]", :version=>/Enhydra Application Server\/([^\s]+)/ },

]

end

