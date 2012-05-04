##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EdgePrism" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-24
version "0.1"
description "Edge Prism Content Delivery Network (CDN)"

# ShodanHQ results as at 2012-03-24 #
# 15,549 for EdgePrism -EdgePrismSSL
# 12 for EdgePrismSSL

# Examples #
examples %w|
69.164.35.226
87.248.214.112
208.111.170.106
111.119.13.131
69.164.9.102
69.164.37.95
68.142.120.45
87.248.218.132
68.142.93.213
178.79.202.2
208.111.179.92
111.119.3.100
95.140.230.180
208.111.171.219
87.248.206.100
117.121.250.114
208.111.155.165
203.77.187.37
69.28.157.219
68.142.107.89
|

# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^EdgePrism\/([^\s]+)$/ },

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^EdgePrismSSL/ },

]

end

