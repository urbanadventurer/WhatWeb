##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web-Crossing-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-06
version "0.1"
description "Homepage: http://bayspire.com/"

# ShodanHQ results as at 2011-01-06 #
# 116 for Web Crossing(r)

# Examples #
examples %w|
66.228.42.190
173.255.196.227
173.255.194.156
178.79.165.243
70.89.211.91
208.93.170.38
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Web Crossing\/([^\s]+)$/ },
{ :search=>"headers[server]", :version=>/^Web Crossing\(r\) [^\s]+-v([\d\.]+) built/ },

# Set-Cookie # webxSess
{ :search=>"headers[set-cookie]", :regexp=>/webxSess=[\d]+\.[^\s]+;/ },

]

end

