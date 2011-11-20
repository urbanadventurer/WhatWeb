##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SDL-Tridion-WCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-20
version "0.1"
description "SDL Tridion WCMS - Web Content Management System (WCMS) - Homepage: http://www.sdl.com/en/wcm/products/sdltridion/default.asp"

# ShodanHQ results as at 2011-11-20 #
# 76 for Product: Tridion Dynamic Content Web Application

# Examples #
examples %w|
15.192.0.146
15.192.0.148
15.192.0.150
15.192.0.164
15.192.0.166
15.192.0.167
15.192.0.168
15.192.0.169
15.193.24.200
15.193.24.201
15.193.24.202
15.193.24.203
15.193.24.204
15.201.32.150
15.201.32.151
15.201.32.152
15.216.28.60
15.216.28.61
15.216.28.62
15.216.28.63
15.216.28.64
15.216.28.65
15.217.8.204
15.240.33.57
15.240.33.64
|

# Matches #
matches [

# Version Detection # HTTP Product-Version Header
{ :search=>"headers[product-version]", :version=>/^(.+)$/ },

# Year Detection # HTTP Product Header
{ :search=>"headers[product]", :string=>/^Tridion (20[\d]{2}) Dynamic Content Web Application$/ },

]

end

