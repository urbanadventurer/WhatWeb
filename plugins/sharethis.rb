##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ShareThis" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "ShareThis is a utility that makes it easy to share articles to social media websites like Digg or Facebook [JavaScript]"
website "http://sharethis.com/"



# Matches #
matches [

# JavaScript Source
{ :regexp=>/<script [^>]*src=["|'][^"^']+w\.sharethis\.com\//i },

]

end


