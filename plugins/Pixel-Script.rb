##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pixel-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "From simple to complex pixel page advertising system PHP Pixel Script makes it possible. - Homepage: http://www.texmedia.de/"

# Google results as at 2011-03-19 #
# 401 for "Powered by Pixel Script"

# Examples #
examples %w|
millionpro.texmedia.de
million.texmedia.de
www.paidbypixels.com/index.php
www.photographerhomepage.com/pixellist.php
www.artworkornetwork.com
www.milliondollarmobiles.com
www.whoscolin.com
www.millionpixelpage.com
ur1inamillion.com
www.onemillionpointsoflight.com
www.aussiemilliondollarhomepage.com.au
www.jamaicapointtopoint.com/ja/
www.rubberstampads.com/legal_notice.php
www.headshotpixels.com/traffic.php
click4phones.net/referrer.php
www.davidmckenna.co.uk
theprinthut.co.uk
www.ruhrpixel.de
www.auctionpalms.com
www.5starpixels.com/beauty.php
framebuyframe.com/index.php?pa=2
www.classified2000.net/pixelads/
pixelpageinternational.com/ranking.php
worldcupwinner.biz
wewantyouout.com
www.findagadgetworldwide.com
www.milliondollarclickpixels.com
www.fishingpixelads.com
|

# Matches #
matches [

# Version Detection # Powered by footer HTML
{ :version=>/<font color=#8888888 style="font-size:9px">Powered by <a href="http:\/\/www.texmedia.de" target="_blank" style="color:#888888;font:normal;text-decoration:none">(Million )?Pixel Script<\/a> v?([^&]+) &copy; <a href="http:\/\/www.texmedia.de" style="color:#888888;font:normal;text-decoration:none" target="_blank">texmedia.de<\/a><\/font>/, :offset=>1 },

]

end


