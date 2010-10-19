##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated matches and removed ghdb match
##
Plugin.define "Zen-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.2"
description "Zen Cart. truly is the art of e-commerce; free, user-friendly, open source shopping cart software. - homepage:http://www.zen-cart.com/"

# About 31,400,000 results for +intitle:"Powered by Zen Cart!, The Art of E-commerce" @ 2010-06-01
# Find more shops here: http://www.zen-cart.com/index.php?main_page=showcase
examples %w|
http://demo.opensourcecms.com/zencart/
http://www.livedemo.com/scripts/zencart/
http://www.flagshipmodels.com/zencart/
http://www.zencartassist.com.au/
http://doreenvirtuellc.com/
http://tarotconnection.net/shop/
http://www.lacedshop.com/
http://www.cherryzen.sagefish.com/
http://www.thewebguys.org/photoshop/
http://gear.medeek.com/
http://www.bebestshopping.com/
http://www.infant-headbands.com/
http://www.curiouscountrycreations.com/
http://www.hijoyce.com/
http://ukdiscountsuperstore.co.uk/shop/
http://www.dressandtux.com/
http://www.paulsadventures.ca/geocart/
http://bacoswineshop.com/
http://www.lovescosmetics.com/
http://www.ambulanceparts.co.uk/catalog
http://www.dnk-communications.com/
http://www.bordz.net/shopping
http://www.davidfreelandopals.com/
http://www.sassyyou.co.uk/
http://www.audiofanatic101.com/
http://www.shoeskingdom.info/
|

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


