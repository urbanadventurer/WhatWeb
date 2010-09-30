##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CS-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "CS-Cart is a full e-commerce solution for small to medium sized businesses. The software uses PHP4 and MySQL to provide an easy, quick and flexible interface, allowing you to produce a high functionality on-line store in minutes. It is all 100% template driven! - homepage: http://www.cs-cart.com/"

# 130 results for Powered By CS-Cart - Shopping Cart Software" @ 2010-09-12
examples %w|
8000t.com
alexions.dev.cs-cart.com/demo/
bjcbs.com
caec.co.uk
consolefactory.co.uk
marquenoire.com
mobilelimit.com
mochachino1.com/cart/
rolexury.com
spermarttirici.net
www.bagsbylynn.com
www.baysalexpo.com
www.coop-store.com
www.dorotype.net
www.hdsteals.com
www.ladybird2shop.com
www.liondecommerce.com/en/
www.onekickparts.com
www.plottertec.net
www.pricesmartpro.com
www.sharkass.com/sys/
www.steventhedj.com
|

matches [

# Default javascript
{ :text=>"	text_required_group_product: 'Please select a product for the required group [group_name]'," },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.cs-cart.com" target="_blank"[^>]+>CS-Cart - Shopping Cart Software<\/a>/ },

# Default title
{ :text=>"<title>CS-Cart. Powerful PHP shopping cart software</title>" },

]

end

