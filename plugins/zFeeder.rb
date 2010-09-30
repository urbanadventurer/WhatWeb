##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "zFeeder" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-22
version "0.1"
description "check zFeeder if you want to show other's RSS content (news and much more) on your website, wapsite or use it on your PC (or intranet) as a news reader. - homepage: http://zvonnews.sourceforge.net/"

# 319 results for "powered by zFeeder" @ 2010-08-22
# 148 results for "powered by zFeeder" inurl:zfposition|zfcategory @ 2010-08-22
examples %w|
skiing.newsonly.org
wine.newsonly.org
voip.newsonly.org
rugby.newsonly.org
tennis.newsonly.org
sailing.newsonly.org
paranormal.newsonly.org
nanotechnology.newsonly.org
cooking.newsonly.org
cricket.newsonly.org
drinkrecipes.newsonly.org
hybridcar.newsonly.org
physics.newsonly.org
golf.newsonly.org
redstate.newsonly.org
bluestate.newsonly.org
benionline.com.np/feed/demo_categories.php
infopanic.com/rss/rss1.php
larispickett.net
laris.mobi
miniaturegarden.info/index.php
minigardens.info
digitalsignagedownloads.com
horseracing.newsonly.org
waltseed.com
brinkman-web.com/feeder/newsfeeds/zfeeder.php
links.gocom.ca/newscanadamaritimes.php
itn2002.sakura.ne.jp/cgi-bin/rss/index.php
code-hunter.com/commentary.php
linuxreview.net
corporatehell.org
jb.zippytech.com/newsfeeds/zfeeder.php
bookofmothers.com/newsfeeds/zfeeder.php
blogger.eslmonkeys.com
eaglesnews.com
kusadasitourism.com
d1n60.com
spidernet.freecoolsite.com/itvijesti_ino_rss.php
grovezone.com/grove/newsfeeds/macrumors.php
ausengsol.com
www.gitta.info/website/en/html/newsfeed.php
www.nysestocks.co.uk
www.lunkens.de/feed.php
www.zimmert.de
www.burzoff.com/order.php
www.braveterry.com/newsfeeds/zfeeder.php
www.harrymillercorp.com
www.rwanda-genocide.org/news.php
www.anxietymadewell.com
www.logodesign.com/logo_design_news_tips.php
www.self-wateringpots.com
www.larispickett.name/index.php
www.goldrush.com/main_frame.php
www.msdesign.de/JOOMLA/media/newsfeeds/zfeeder.php
www.scicentral.com
www.arn.org/_idarts/
www.spamhelp.org
www.creukradio.org/rssfeeder/newsfeeds/zfeeder.php
www.tooratouristpark.com.au
www.bhutandukartours.com
www.forexrate.co.uk
www.razorthought.com
www.iphonebuglist.com
www.aclasscelebs.com/camerond/
www.iforani.com/index2.php
www.hotel-in-ibiza.com
www.militaryantiquesandfossils.com
www.clanmage.net
www.performancepcky.com/newsfeeds/zfeeder.php
www.cyclingforfun.org/cff/feed/zfeeder.php
www.pcoxygen.com/news.html
www.starfishsoftware.com.au
www.vctv.com/webportal/lutherhaven/
www.avfilter.com/spam-news.php
www.propertydragon.com/index.php
www.freemediaproductions.info
www.deborahbaxley.com
www.hotel-in-benidorm.com
www.toner-papier.de/zfeeder-1.6/news.php
www.livinghopecma.org/test/newsfeeds/zfeeder.php
www.studien-von-zeitfragen.de/newsfeeds/zfeeder.php
www.onlineflighttraining.com/index.php
www.hotel-in-marbella.com
www.southbrittanycottage.com/index.php
www.gotzmanngroup.com/news.php
www.andyduffell.com/links.php
www.info-tag.de/zfeeder-1.6/news.php
www.gotzmanngroup.net/news.php
www.biovane.com/intellectual_property_news.php
|

matches [

# From the homepage: please keep the link: "powered by.." or use the logo
{ :text=>'<span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small;">powered by <a href="http://zvonnews.sourceforge.net">zFeeder</a></span>' },

]

end

