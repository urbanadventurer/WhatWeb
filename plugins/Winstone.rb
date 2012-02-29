##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Winstone" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-23
version "0.1"
description "Winstone is a servlet container that was written out of a desire to provide servlet functionality without the bloat that full J2EE compliance introduces. - Homepage: http://winstone.sourceforge.net/"

# ShodanHQ results as at 2012-02-23 #
# 293 for Winstone Servlet Engine

# Examples #
examples %w|
150.146.160.229
174.129.86.99
66.228.62.114
46.137.173.238
75.101.248.12
184.106.211.201
212.63.68.198
184.107.133.230
199.168.174.159
174.143.25.176
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Winstone Servlet Engine v([^\s]+)/ },

# Version Detection # X-Powered-By Header
{ :search=>"headers[x-powered-by]", :version=>/Servlet\/[^\s]+ \(Winstone\/([^\)]+)\)/ },

]

end

