##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Interspire-Shopping-Cart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.1"
description "Interspire Shopping Cart is an all-in-one e-commerce and shopping cart software platform that includes absolutely everything you need to sell online and attract more customers using the power, reach and affordability of the Internet. - homepage: http://www.interspire.com/shoppingcart/"

# 139 results for "Powered by Interspire Shopping Cart" intitle:"Shopping Cart" inurl:cart.php @ 2010-08-06
# 307 results for "Powered by Interspire Shopping Cart' @ 2010-08-06
examples %w|
shoppingcart.interspire-demo.com/demo_72767580/
store.weismannweb.com
anthemdvd.com/store/cart.php
www.gizmodaddy.com/storefront
www.shelburnecountrystore.com
www.4ezrecycledproducts.com
www.pimentadoceperfumaria.com.br
www.tegatech.com.au/resellers/cart.php
www.uogstore.com/demise_store/cart.php
estore.circuitassembly.com/cart.php
www.ladybug-secure.com/shoppingcart/cart.php
www.pna247.co.uk/shoppingcart/cart.php
cws.max-online-shopping.com/cart.php
sulphurichost.com/shop/cart.php
www.kivakreations.com/cart.php
www.singlelatinasonline.com/store/cart.php
collegefreshmansurvival.com/shoppingcart/cart.php
www.iblackink.com/webstore/cart.php
chainlinkcomputers.host22.com/cart.php
www.pclife.nl/cart.php
home.jcsss.com:8080/store2/cart.php
www.yeniusinteractive.com/cart.php
www.mhomestore.com/cart.php
www.overundies.com/cart.php
www.chalkandali.com/cart.php
diva307.com/cart.php
www.stem-organics.com/cart.php
www.mypoolsupplyguys.com/cart.php
www.inkdaddys.com/store/cart.php
www.uniquefreak.co.uk/shoppingcart/cart.php
store.hotboricuas.net/cart.php
www.stogieshumidors.com/cart.php
www.clickontools.co.uk/cart.php
www.i-dealstore.co.uk/cart.php
www.bendavidjewelers.com/cat/cart.php
www.belowzeroliquids.com/cart.php
www.mamyandkids.com/cart.php
|

matches [

{ :text=>'	<meta name="generator" content="Interspire Shopping Cart" />' },

#<!-- Removing or editing this "Powered by" link will violate your license agreement unless you have purchased private label rights.  -->
{ :regexp=>/				Powered by <a href="http:\/\/www.interspire.com\/shoppingcart[\/]*" target="_blank" class="PoweredBy">Interspire Shopping Cart<\/a>/ },

]

end

