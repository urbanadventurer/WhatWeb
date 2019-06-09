##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Meta-Country"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-20
  # v0.2 # 2011-03-31 # Updated regex. 
]
version "0.2"
description "This plugin retrieves the country from the meta country tag. This tag is used by the Gigablast search engine."



# Matches #
matches [

# Extract country
{ :string=>/<meta[^>^=]+name[\s]*=[\s]*['"]?country[^>^=]+content[\s]*=[\s]*['"]?([^'^"^>]+)/i },
{ :string=>/<meta[^>^=]+content[\s]*=[\s]*['"]?([^"^'^>]+)[^>^=]+name[\s]*=[\s]*['"]?country/i },

]

end

