##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RiOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "Riverbed Optimization System (RiOS) - Homepage: http://www.riverbed.com/"

# Technical Overview #
# http://www.riverbed.com/assets/fr/media/documents/briefs/TechOverview-Riverbed-RiOS_6.0.pdf

# ShodanHQ results as at 2012-08-26 #
# 286 for X-RBT-Optimized-By

# Examples #
examples %w|
66.161.123.45
216.49.215.25
62.157.209.52
192.107.155.6
206.195.100.35
59.163.33.35
200.0.118.222
204.120.70.38
199.15.169.102
66.231.227.104
63.99.230.220
41.168.5.168
196.37.143.137
66.231.227.80
66.231.227.75
137.224.129.217
|

# Matches #
matches [

# X-RBT-Optimized-By Header
{ :search=>"headers[x-rbt-optimized-by]", :version=>/\(RiOS ([^\s]+)\)/ },

# X-RBT-Optimized-By Header
{ :search=>"headers[x-rbt-optimized-by]", :string=>/(.+) \(RiOS/ },

]

end

