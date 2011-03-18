##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ECShop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "Ecshop is an Open Source Ecommerce Platform - Homepage: http://www.ecshop.org/"

# Google results as at 2011-03-18 #
# 485 for "powered by ECSHOP"

# Examples #
examples %w|
www.iamfashion2u.com
www.facial-shop.com
www.onlyangel.com
www.foneso.com
www.cutiemambabystore.com
oursportworld.com
www.kingshowbox.com/index.php
mycutieshop.com
m2bstation.com
www.shop-six.com/index.php
www.kkperfect.com
www.d1mobi.com
shop.mf8.com.cn
www.enzoautogallery.com
www.exnod.com
www.pspywf.com
www.chinasourcegroup.com
shingseasonind.com
www.glitzyeshop.com
www.777bags.com
findjoy.net
www.nnoni.com
www.buy4ssd.com
www.epf.com.tw/enshop/index.php
|

# Matches #
matches [

# Title
{ :certainty=>25, :regexp=>/<title>[^<]+ - Powered by ECShop<\/title>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="ECSHOP v([\d\.]+)" \/>/ },

]

end


