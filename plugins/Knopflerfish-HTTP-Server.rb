##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Knopflerfish-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-18
version "0.1"
description "Knopflerfish HTTP Server - Small footprint OSGi HTTP server implementation for embedded use - Homepage: http://www.knopflerfish.org/"
# More Info: http://www.knopflerfish.org/releases/3.2.0/docs/bundledoc/http/index.html

# ShodanHQ results as at 2012-01-18 #
# 95 for Knopflerfish

# Examples #
examples %w|
129.170.250.41:8080
188.204.251.78
90.190.254.167
31.220.229.54
89.181.152.127
80.223.154.40
82.37.168.162
94.229.55.226
|

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^The Knopflerfish HTTP Server$/ },

]

end

