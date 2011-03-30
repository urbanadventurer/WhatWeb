##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.3
# Added gaq.push version, moved everything from passive into matches[]
# returning analytics UA, not just account ID

# Version 0.2
# removed :probability
Plugin.define "Google-Analytics" do
author "Andrew Horton"
version "0.3"
description "Google Analytics is the enterprise-class web analytics solution that gives you rich insights into your website traffic and marketing effectiveness. Homepage: www.google.com/analytics/"


matches [
{:account=>/_gaq\.push\(\['_setAccount', '([^)]+)'\]\);/,:name=>"gaq.push" }, # works
{:account=>/var pageTracker = _gat._getTracker\("([^"]+)"\);/, :name=>"_gat"}, #" works
{:account=>/urchin.*_uacct = "([^"]+)";/m, :name=>"urchin"}, #"
{:account=>/window.google_analytics_uacct = "([^"]+)";/, :name=>"window.google_analytics_uacct"}, #"
]


end


