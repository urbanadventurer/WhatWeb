##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Think-Plus" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-07
version "0.1"
description "Think+ - Social Media Marketing"
website "http://think-plus.gr/"

# Google results as at 2012-04-07 #
# 140 for "Powered by Think+"
#  23 for "Powered by Think+" inurl:"info.php?category_id="

# Dorks #
dorks [
'"Powered by Think+"'
]



# Matches #
matches [

# Powered by
{ :text=>'<div class="copy">Powered by <a href="http://think-plus.gr">Think+</a>' },

# Meta Author
{ :text=>'<meta name="author" CONTENT="Think+">' },

]

end

