##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WP-SlimStat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-18
version "0.1"
description "A lightwight but powerful real-time web analytics plugin for WordPress"
website "https://wordpress.org/extend/plugins/wp-slimstat/"

# ShodanHQ results as at 2011-08-18 #
# 92 for slimstat_tracking_code



# Matches #
matches [

# slimstat_tracking_code Cookie
{ :search=>"headers[set-cookie]", :regexp=>/slimstat_tracking_code=[a-f\d]{32};/ },

]

end

