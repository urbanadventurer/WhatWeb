##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WP-SlimStat" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-18
version "0.1"
description "A lightwight but powerful real-time web analytics plugin for WordPress - Homepage: https://wordpress.org/extend/plugins/wp-slimstat/"

# ShodanHQ results as at 2011-08-18 #
# 92 for slimstat_tracking_code

# Examples #
examples %w|
173.254.19.22
67.202.23.254
188.121.59.61
86.188.176.50
67.20.105.85
173.254.15.176
194.218.203.17
173.201.0.189
|

# Matches #
matches [

# slimstat_tracking_code Cookie
{ :search=>"headers[set-cookie]", :regexp=>/slimstat_tracking_code=[a-f\d]{32};/ },

]

end

