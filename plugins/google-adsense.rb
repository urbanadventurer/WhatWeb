# -*- coding: utf-8 -*-
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1
# First version, might not be perfect
##
Plugin.define "Google-AdSense" do
author "Patrik Wallström"
version "0.1"
description "Google Adsense offers a contextual advertising solution to web publishers Delivers text-based Google AdWords ads that are relevant to site content pages. Homepage: www.google.com/adsense/"

# Matches #
matches [

# Extract client id from javascript
{:account=>/google_ad_client = "([^"]+)";/m, :name=>"client" },

]

end

