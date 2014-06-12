##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Geography" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the geography from the meta geography, geo.position, geo.placename and geo.region tags."



matches [

# Get geography
{ :string=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geography[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geography/i },

# Get geo.position
{ :string=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.position[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.position/i },

# Get geo.placename
{ :string=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.placename[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.placename/i },

# Get geo.region
{ :string=>/<meta[^>]+name[\s]*=[\s]*[\'|\"]?geo.region[^>]+content[\s]*=[\s]*[\'|\"]?([^\'^\"\/^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*[\'|\"]?([^\"^\']+)[^>]+name[\s]*=[\s]*[\'|\"]?geo.region/i },

]

end

