##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Zeus-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "Control every facet of your store, from merchandising to promotions and more. There are no limits to creativity with ZeusCart."
website "http://www.ajsquare.com/AJE-Commerce/product-home.php"

# Google results as at 2010-08-06 #
# 43 for "powered by ZeusCart"

# Dorks #
dorks [
'"powered by ZeusCart"'
]



# Matches #
matches [

# Install Page # Default install warning message
{ :text=>'<img src="images/warning.gif">Warning: Installation directory exists ZEUSCART ROOT DIRECTORY/install. Please remove/rename this directory for security reasons.' },

# Powered by text
{ :text=>'Powered by <a href="http://www.ajsquare.com/products/ecom/" style="color:#716f6f;" target="_blank">ZeusCart</a>' },

# Admin Page # Default Title
{ :text=>'<title>:: Zeuscart Admin Panel</title>' },

# Version Detection # Default Title
{ :version=>/<title>[\s]+ZeusCart V([\d\.]+)[\s]+<\/title>/ },

]

end

