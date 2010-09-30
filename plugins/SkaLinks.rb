##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SkaLinks" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "SkaLinks - Free Links Exchange software - homepage: http://www.skalinks.com/"

# 305 results for "powered by SkaLinks" "Link Exchange Script" @ 2010-08-14
examples %w|
goodlinkpages.com
www.anxietytreatmentcritic.com/links/dirtree.php
mauritiusorchid.com/Mauritius-Links/search.php
www.logoland.com.au/links/
www.lunchpocket.com/skalinks/
www.odctravel.com.vn/links/travel-reviews/index.html
kenax.net/recip/
www.thegadgitech.com/resources/best_homebased_businesses/index.php
secretproduct.com/links/Software/index.html
www.linkexchange4u.com
www.itpgateway.com
www.xtrabyte.biz
www.irpediatravellinks.com
www.mcarrent.com/link/Crafts/index.html
www.atacadobiju.com.br/links/jewelry/index.html
reciprocal-links.netvantage.net.au/resources/
www.njboxers.com/dir/detailed/listing59.html
www.autos-links.com/detailed/listing889.html
getfreestuffs.com/
www.microalpha.biz/skalinks/
www.beforechristmasnightmare.net/detailed/
uk-directory.org.uk
www.ads4dating.net/site/search.php
doneritehosting.net/link_exchange/exchange/
www.tekwizard.com.au/resources/detailed/listing31.html
menopausereliefcritic.com/links/
www.letstalkcameras.com/links/
www.gratum.com/links/
high-pr-directory.co.uk
matrimonial-link-exchange.shubhshagun.com/search.php
site-dir.info
links.mohographic.com
generatorfavicon.com/link-exchange/search.php
brands-for-life.com
|

matches [

{ :text=>'Powered by <a class=sub_cat href="http://www.skalinks.com">SkaLinks - Link Exchange Script' },

{ :text=>'Powered by <a class=sub_cat href="http://www.skalinks.com" rel="nofollow">SkaLinks - Link Exchange Script' },

{ :text=>'Powered by <a class=sub_cat rel="nofollow" href="http://www.skalinks.com">SkaLinks - Link Exchange Script' },

]

end

