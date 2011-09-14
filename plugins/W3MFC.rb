##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "W3MFC" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "W3Mfc is a collection of MFC classes to implement a Web Server - homepage: http://www.naughter.com/w3mfc.html"

# ShodanHQ results as at 2010-11-01 #
# 5,486 for "Server: W3MFC"

# Examples #
examples %w|
76.217.77.98
60.249.212.232
190.56.134.234
76.180.117.102
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^W3MFC\/([\d\.]+)$/  },

]

end

