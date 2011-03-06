##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Pro-Bid" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "PHP Pro Bid - Auction software - Homepage: http://www.phpprobid.com/"

# Google results as at 2011-02-27 #
# 33 for "PLEASE LOGIN TO THE ADMIN AREA" "Current Version"

# Examples #
examples %w|
www.phpprobid.com/auction-software-demo/admin/login.php
www.phpprobid.com/v61_beta/admin/login.php
trueant.com.au/admin/login.php
ocbay.net/admin/login.php
www.realecoves.com/admin/login.php
www.gulfonlineauction.com/admin/login.php
www.auctionzz.com/admin/login.php
www.jadeaccessories.co.cc/admin/login.php
www.horseshowapparelexchange.com/admin/login.php
www.fishingtackleauction.net/admin/login.php
www.gundeals.co.uk/admin/login.php
www.directagsales.com/bid/admin/login.php
www.aucit.eu/admin/login.php
gidiyoryakala.com/admin/login.php
www.casadodesbravador.com/ml/admin/login.php
www.auktionshaus-royalbay.de/admin/login.php
www.sellbidandbuy.com/admin/login.php
www.dudush.com/admin/login.php
www.happydeal24.de/admin/login.php
www.usebids.com/admin/login.php
mo.auctions.buystation.com/admin/login.php
hk.auctions.buystation.com/admin/login.php
dev.bidonmybeachhouse.com/admin/login.php
www.phpproads.com/ads-software-demo/admin/login.php
www.phpproads.com/profile-ads-demo/admin/login.php
www.hunterclassifieds.com.au/admin/login.php
sg.auctions.buystation.com/admin/login.php
www.boutiquedujour.com/you_bid/v607/admin/login.php
|

# Matches #
matches [

# Version Detection # Copyright text
{ :version=>/            <div class="version">Current Version:[\r\n]+               ([\d\.]{1,5})            <\/div>[\r\n]+/ },

# Admin Page # Login text
{ :regexp=>/<td colspan="2" bgcolor="#[^"]{3,6}" style="color: #ffffff; font-weight: bold;">PLEASE LOGIN TO THE ADMIN AREA<\/td>/ },

]

end


