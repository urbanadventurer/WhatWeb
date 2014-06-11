##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Meta-Author" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "This plugin retrieves the author name from the meta name tag - info: http://www.webmarketingnow.com/tips/meta-tags-uncovered.html#author"



# Matches #
matches [

# Get author's name
{ :string=>/<meta[^>^=]+name[\s]*=[\s]*['"]?author['"]?[^>^=]+content[\s]*=[\s]*['"]([^'^"^>]+)/i },
{ :string=>/<meta[^>^=]+content[\s]*=[\s]*['"]([^"^'^>]+)['"][^>^=]+name[\s]*=[\s]*['"]?author['"]?/i },

]

end

