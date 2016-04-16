##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SDL-Tridion-WCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-20
version "0.1"
description "SDL Tridion WCMS - Web Content Management System (WCMS)"
website "http://www.sdl.com/en/wcm/products/sdltridion/default.asp"

# ShodanHQ results as at 2011-11-20 #
# 76 for Product: Tridion Dynamic Content Web Application



# Matches #
matches [

# Version Detection # HTTP Product-Version Header
{ :search=>"headers[product-version]", :version=>/^(.+)$/ },

# Year Detection # HTTP Product Header
{ :search=>"headers[product]", :string=>/^Tridion (20[\d]{2}) Dynamic Content Web Application$/ },

]

end

