##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "siteGENIUS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "siteGENIUS, a custom website builder that lets you create your own website."
website "http://www.sitegenius.com/"

# Google results as at 2011-08-03 #
# 67 for inurl:"sitegenius/topic.php?id="

# Dorks #
dorks [
'inurl:"sitegenius/topic.php?id="'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'inurl:"sitegenius/topic.php"' },

# JavaScript # PortalBrowser Popup
{ :regexp=>/var PortalBrowser = window.open\('popup.php\?page_type='\+page_type\+'&lang=[A-Z]{2}&page_id='\+pgid(\+addToURL)?, '', myFeatures\); / },

]

end


