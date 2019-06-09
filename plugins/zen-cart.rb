##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Zen-Cart"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-01 
  # v0.2 # Updated matches and removed ghdb match. 
  "Andrew Horton", # v0.3 # 2016-04-17 # Added website parameter. 
]
version "0.3"
description "Zen Cart. truly is the art of e-commerce; free, user-friendly, open source shopping cart software."

website "http://www.zen-cart.com"
# Find more shops here: http://www.zen-cart.com/index.php?main_page=showcase

# Google results as at 2011-04-15 #
# 361 for "Powered by Zen Cart!, The Art of E-commerce"

# Dorks #
dorks [
'"Powered by Zen Cart!, The Art of E-commerce"'
]



# <meta name="author" content="The Zen Cart&trade; Team and others" />
# <meta name="generator" content="shopping cart program by Zen Cart&trade;, http://www.zen-cart.com eCommerce" />
# <meta name="generator" content="shopping cart program by Zen Cart&trade;, http://www.zen-cart.com" /> 

matches [

# About 31,400,000 results for +intitle:"Powered by Zen Cart!, The Art of E-commerce" @ 2010-06-01

# Default title
{ :text=>"Powered by Zen Cart!, The Art of E-commerce</title>" },

# According to the Zen Cart rules: "You must have the reciprocal link - Powered by Zen Cart in the footer."  
{ :text=>'Powered by <a href="http://www.zen-cart.com" target="_blank">Zen Cart</a>' },

# Default meta authors
{ :text=>'<meta name="authors" content="The Zen Cart&trade; Team and others' },

# Meta generator
{ :text=>'<meta name="generator" content="shopping cart program by Zen Cart&trade;, http://www.zen-cart.com' },

]

end


