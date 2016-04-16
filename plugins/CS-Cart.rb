##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CS-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "CS-Cart is a full e-commerce solution for small to medium sized businesses. The software uses PHP4 and MySQL to provide an easy, quick and flexible interface, allowing you to produce a high functionality on-line store in minutes. It is all 100% template driven!"
website "http://www.cs-cart.com/"

# Google results as at 2010-09-12 #
# 130 for "Powered By CS-Cart - Shopping Cart Software"

# Dorks #
dorks [
'"Powered By CS-Cart - Shopping Cart Software"'
]



matches [

# Default javascript
{ :text=>"	text_required_group_product: 'Please select a product for the required group [group_name]'," },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.cs-cart.com" target="_blank"[^>]+>CS-Cart - Shopping Cart Software<\/a>/ },

# Default title
{ :text=>"<title>CS-Cart. Powerful PHP shopping cart software</title>" },

]

end

