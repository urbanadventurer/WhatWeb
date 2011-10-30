##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Traffic-Inspector" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-30
version "0.1"
description "An integrated gateway solution for controlling access to the Internet and for providing data transmission services. - Homepage: http://www.trafinsp.com/products/Traffic-Inspector/"

# ShodanHQ results as at 2011-10-30 #
# 141 for Traffic inspector

# Examples #
examples %w|
83.242.255.1
77.239.235.103
213.242.252.141
94.25.62.202
62.117.110.230
62.117.110.228
188.128.15.78
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Traffic [Ii]nspector HTTP\/FTP\/Proxy server \(([^\)]+)\)$/ },

# 403 Page # Hostname (?)
{ :url=>"/", :status=>403, :string=>/<title>Error<\/title><\/head><body><h1>403 - Forbidden<\/h1><hr( class="footer")?>Traffic [Ii]nspector HTTP\/FTP\/Proxy server \([^\)]+\)<br>([^<^\/]+)\s*\/?\s*[\d]{2}\.[\d]{2}\.[\d]{2}/, :offset=>1 },

]

end

