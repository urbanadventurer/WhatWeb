##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BM-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "A complete classifieds site ready to run in 15 minutes. - homepage: http://www.bmscripts.com/"

# 97 results for "powered by BM Classifieds" @ 2010-08-08
examples %w|
classifieds.bmscripts.com
classifieds.heraldfnq.com
www.kellywantads.net
www.allwantads.com
www.cherokeewantads.com
www.meetingbucket.org
www.shenandoahads.com/index.php
attachmentsusa.com
www.dellsads.com
www.lookclassifieds.com
davaoclassifiedads.com
classifieds4pets.com
www.craftshowdates.com
www.imoveispt.com
www.panamacityclassified.com
www.uaedunes.com
lavernewantads.com
www.iklanvalley.com
dragmeet.com
www.metrovancouverclassifiedads.com
tulipbedclassifieds.com
www.southernvaclassifieds.com
usedcarstrucksforsale.com
www.usedconcession.com
classifieds.harrison-arkansas.net
myad.ae
moonlightinads.com
www.antiquefurniture.us
www.businessopportunityshop.com
classifiedads.es
www.thelabstuff.com
hobbyshows.hobbyshowdates.com
cornerclutter.com
www.auctionflavaskb.com
www.classifieds.escarosapress.com
seiads.com
iklanxl.com
www.centrocomer.com
fleamarkets.hobbyshowdates.com
hobbyshowdates.com
uklocalclassifieds.com
|

matches [

{ :text=>'<!-- // All source code on this site © 2007 BM Scripts unless otherwise stated - All Rights Reserved // -->' },
{ :text=>'<!-- // All source code on this site © 2007 BM Scripts unless otherwise noted - All Rights Reserved // -->' },
{ :text=>'		<!-- START HEADER TABLE - HOLDS GRAPHIC AND SITE NAME -->' },
{ :text=>'		<!-- START MAIN TABLE - HOLDS CATEGORIES, MENU, ETC. -->' },
{ :text=>"	<p class='credits'><a href='http://www.bmscripts.com'>Powered by BM Classifieds</a><br /></p>" },
{ :text=>"	<p class='credits'>Powered by BM Classifieds<br /></p>" },

]

end

