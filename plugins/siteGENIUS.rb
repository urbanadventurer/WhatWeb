##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "siteGENIUS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "siteGENIUS, a custom website builder that lets you create your own website. - Homepage: http://www.sitegenius.com/"

# Google results as at 2011-03-14 #
# 56 for inurl:"sitegenius/topic.php"

# Examples #
examples %w|
www.euraxess.rs/sitegenius/
www.fovea.com/sitegenius/
www.fovea.ch/sitegenius/
www.sunnybit.com/sitegenius/
www.euraxess.me/sitegenius/
www.skinis.org.rs/sitegenius/
www.masfak.ni.ac.rs/sitegenius/
webmob.masfak.ni.ac.rs/sitegenius/
www.newenproject.org/sitegenius/
www.freeyourdata.net/sitegenius/
www.seesciencepolicy.org/sitegenius/
www.iseemob.eu/sitegenius/
www.intersectoralmobility.eu/sitegenius/
www.pevo-kmuberatung.ch/sitegenius/
www.foveaonline.ch/fovea/sitegenius/
www.sunnybit.ch/sitegenius/
www.skiandsun.co.rs/sitegenius/
www.sokobanja.org.rs/sitegenius/
www.rotary-brb.ch/sitegenius/
www.mobi4you.com/sitegenius/
|

# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'inurl:"sitegenius/topic.php"' },

# JavaScript # PortalBrowser Popup
{ :regexp=>/var PortalBrowser = window.open\('popup.php\?page_type='\+page_type\+'&lang=[A-Z]{2}&page_id='\+pgid(\+addToURL)?, '', myFeatures\); / },

]

end


