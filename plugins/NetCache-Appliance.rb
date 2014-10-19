##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetCache-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-09
version "0.1"
description "NetCache is a former web cache software product which was owned and developed by NetApp and sold to Blue Coat Systems."
website "http://www.netapp.com/us/products/netcache.html"

# ShodanHQ results as at 2012-03-09 #
# 141,128 for netcache netapp



# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^NetCache appliance \(NetApp\/([^\)]+)\)$/ },

]

end

