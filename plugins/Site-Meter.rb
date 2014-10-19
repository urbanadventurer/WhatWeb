##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Site-Meter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "A fast, free Web counter that features custom counters styles. Site Meter creates dynamic 3D charts showing visitors, page views, country maps, visit durations and much more."
website "http://www.sitemeter.com/"



# Matches #
matches [

# Account Detection # Script tag
{ :account=>/<script [^>]*src=["']http:\/\/[^>]+sitemeter\.com\/js\/counter\.js\?site=([^"^'^>]+)[^>]*>/i },

# Account Detection # img tag
{ :account=>/<img [^>]*src=["']http:\/\/[^>]+sitemeter\.com\/meter\.asp\?site=([^"^'^>]+)[^>]*>/i },

# HTML Comment
{ :certainty=>25, :text=>"<!-- Site Meter -->" },

# HTML Comment # Copyright
{ :regexp=>/<!-- Copyright \(c\)20[\d]{2} Site Meter -->/ },

]

end


