##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VamCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-18
version "0.1"
description "VamCart - CakePHP Based Open Source Shopping Cart"
website "http://vamcart.com/"

# Google results as at 2012-07-18 #
# 5 for "VamCart" "Shipping and Returns" inurl:"page/shipping--returns.html"

# Dorks #
dorks [
'# 5 for "VamCart" "Shipping and Returns" inurl:"page/shipping--returns.html"'
]



# Matches #
matches [

# StyleSheet
{ :regexp=>/<link type="text\/css" href="[^"]+\/stylesheets\/load\/vamcart\.css" rel="stylesheet"  media="screen"\/>/ },

# HTML Comment
{ :text=>'<!-- Powered by: VamCart (http://vamcart.com) -->' },

# Footer
{ :text=>'<p><a href="http://vamcart.com/">PHP Shopping Cart</a> <a href="http://vamcart.com/">VamCart</a></p>' },

]

end

