##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetCache-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "NetCache is a former web cache software product which was owned and developed by NetApp and sold to Blue Coat Systems. - Homepage: http://www.netapp.com/us/products/netcache.html"

# ShodanHQ results as at 2012-03-09 #
# 141,128 for netcache netapp

# Examples #
examples %w|
150.84.174.14
133.30.202.88
133.30.84.46
133.30.242.248
133.30.82.18
150.84.37.45
133.30.108.23
133.30.109.68
150.84.72.223
84.54.21.156
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^NetCache appliance \(NetApp\/([^\)]+)\)$/ },

]

end

