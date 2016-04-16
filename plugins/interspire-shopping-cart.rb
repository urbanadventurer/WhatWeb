##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Interspire-Shopping-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "Interspire Shopping Cart is an all-in-one e-commerce and shopping cart software platform that includes absolutely everything you need to sell online and attract more customers using the power, reach and affordability of the Internet."
website "http://www.interspire.com/shoppingcart/"

# 139 results for "Powered by Interspire Shopping Cart" intitle:"Shopping Cart" inurl:cart.php @ 2010-08-06
# 307 results for "Powered by Interspire Shopping Cart' @ 2010-08-06

# Dorks #
dorks [
'"Powered by Interspire Shopping Cart"'
]



matches [

{ :text=>'	<meta name="generator" content="Interspire Shopping Cart" />' },

#<!-- Removing or editing this "Powered by" link will violate your license agreement unless you have purchased private label rights.  -->
{ :regexp=>/				Powered by <a href="http:\/\/www.interspire.com\/shoppingcart[\/]*" target="_blank" class="PoweredBy">Interspire Shopping Cart<\/a>/ },

]

end

