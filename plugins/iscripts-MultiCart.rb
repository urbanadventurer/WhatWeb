##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-MultiCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts MultiCart is a multi vendor shopping cart with a single backend. - homepage: http://www.iscripts.com/multicart/"

# 110 results for "powered by iScripts MultiCart" @ 2010-07-11
examples %w|
doorcountyshopping.com
www.multicart.biz/productdetails.php
www.turnkeyshops.com/viewcart.php
clients.iscripts.com/sensibledrivers/
eclassgives.com/shopping/
www.zimpay.net/mall/productdetails.php
www.vendoravenue.com/register.php
dropships.arehere.info/viewcart.php
click1market.com
www.creativeakventures.com
www.pinoyshopexpress.com
demo.pinoyshopexpress.com
www.trendythings.biz/theshop/
weebimajutus.ee/multicart/expiredmessage.php
www.tailorplanet.com
www.basscoastbuylocal.com/showportfolio.php
ez-dropship.com/productdetails.php
www.divashops.net/artists/
www.thedancingpigcraftmall.com
www.earthslargest.com/artists/
www.redbarnshopping.com/affiliates/
snozberry.co.uk
www.theindianoutlet.com/affiliates/
www.gmqex.net/store/
myfashiondesigner.com.au
www.myfashiondesigner.com.au
www.webshoppe.com.au
grepafile.com/store/
shutterfund.com
myusedcollege.com/store/
soskyoutfitters.com
www.jamaicasearch.net/searchshoppingmall/
ktiss.com
whipnstitchmall.com
shopsnugglebug.com
catholicfree.com
kildareshoppingcentre.ie/store/
www.shopsnugglebugg.com
www.southernskyoutfitters.com
www.eraklik.com/toko/
www.xl-clients.com/OnlineRestaurants/showportfolio.php
marketafricaner.com/showportfolio.php
www.howtobizbooks.com/shop/showportfolio.php
66.7.221.247/~buydirec/
www.mozame.biz/store/
auwebbs.com/webshoppe/showportfolio.php
www.superheromarket.com/showportfolio.php
www.rdnattural.es/multicentro/
haitistock.com
|

matches [

{ :regexp=>/Powered by <a href="http:\/\/iscripts.com\/multicart"[\ target="_blank"]*><font color="#[a-zA-Z0-9]{6}"><b>iScripts Multicart<\/b><\/font><\/a>. A premium product from <a href="http:\/\/www.iscripts.com" class="" target="_blank"><font color="#[a-zA-Z0-9]{6}"><b>iScripts.com<\/b><\/font><\/a><\/div>/ },

]

end

