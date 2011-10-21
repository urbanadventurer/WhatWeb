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
Plugin.define "Google-AdSense-for-Domains" do
author "Patrik Wallström"
version "0.1"
description "AdSense for domains allows publishers with undeveloped domains to help users by providing relevant information including ads, links and search results. Homepage: http://www.google.com/domainpark/"

# Matches #
matches [

# Extract client id from javascript

{:account=>/<frame name="mainFrame" src="http:\/\/googleads.g.doubleclick.net\/apps\/domainpark\/results.cgi\?client=([a-z0-9-]+)&amp;/m, :name=>"client" },

]

end

