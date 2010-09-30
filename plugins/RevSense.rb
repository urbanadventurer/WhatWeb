##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RevSense" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "RevSense is an online pay per click ad-market. Publicise your ads to a large community using RevSense advertiser account. - homepage: http://www.revsense.com/"

# 106 results for "powered by RevSense" -Vulnerability @ 2010-08-21
examples %w|
andgetpaid.com/adserv/
advertise.sharedcanvas.com
proutandcompanies.com/adserv/index.php
revsense.realityx.cz
adserv.sifir.com
advertisingmd.com
ads.greenpassion.org
ads.escortfrance.ws
ads.searchclone.com
resortvideos.info
islandvideos.info
adventurevideos.info
www.findamachine.com/revsense/
www.integral-ads.com
www.wizzfone.com/Revsense/index.php
www.horseshoemedia.com/revsense/
www.digitalburg.com/revsense/
www.freedomwire.com/revsense/
www.avsim.com/rev/
www.advertizon.com
www.crazyads.co.uk
www.thewebhostingreview.com/ads/
ads.accessnorthga.com
www.joinads.net/ads/
www.venom-center.com/advertising/
www.visualnet.com/visualads/
www.taxi-martadvertising.co.uk/adserve/
www.bluemoonmedia.co.uk/adserver/
www.videosessohardcore.com/revsense/
www.textlinx.com/adserver/
www.1cheval.com/0adswin/
www.4nbf.net/adrev2/index.php
www.coolrunning.com.au/adsystem/index.php
|

matches [

{ :text=>'				<li><a href="http://www.revsense.com.au/"><strong>RevSense</strong> - Powered by RevSense Ads</a></li>' },

{ :text=>'	<!-- You cannot remove this powered by link without receiving permission from W3matter.com -->' },

{ :regexp=>/	<font size=1><a>Powered by Revsense &trade;<\/a> &copy; [0-9]{4} W3matter LLC<\/font>/ },

{ :regexp=>/	<font size=1><a href="http:\/\/www.w3matter.com">Powered by Revsense &trade;<\/a> &copy; [0-9]{4} W3matter LLC<\/font>/ },

]

end

