##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "newswall" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-12
version "0.1"
description "newswall"
website "http://newswall.mayoco.de/"

# Google results as at 2012-08-12 #
# 121 for "There's no newswall without javascript - please activate"
#   5 for "There's no newswall without javascript - please activate" inurl:newswall

# Dorks #
dorks [
'"There\'s no newswall without javascript - please activate" inurl:newswall'
]



# Matches #
matches [

# NoScript
{ :regexp=>/<div id="screen"><noscript><p class="js">\s*There's no newswall without javascript - please activate\.\.\.\s*<\/p><\/noscript><\/div>/ },

]

end

