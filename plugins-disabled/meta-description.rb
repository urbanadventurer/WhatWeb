##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Description" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-20
version "0.1"
description "This plugin retrieves the description from the meta description tag."



# Matches #
matches [

# Get description
{ :string=>/<meta[^>]+name[\s]*=[\s]*['"]?description[^>]+content[\s]*=[\s]*['"]?([^'^"^>]+)/i },
{ :string=>/<meta[^>]+content[\s]*=[\s]*['"]?([^"^']+)[^>]+name[\s]*=[\s]*['"]?description/i },

]

end

