##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HAProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-02-27
version "0.1"
description "Reliable, High Performance TCP/HTTP Load Balancer - Homepage: http://haproxy.1wt.eu/"

# ShodanHQ results #
# 9,975 for HAProxy statistics

# Examples #
examples %w|
198.37.157.101
74.63.236.142
50.31.43.53
208.115.239.73
50.31.33.149
208.117.53.150
50.31.56.148
208.115.235.95
208.117.63.209
50.31.42.205
|

# Matches #
matches [

# WWW-Authenticate: Basic realm="HAProxy Statistics"
{ :status=>401, :search=>"headers[www-authenticate]", :text=>'Basic realm="HAProxy Statistics"' },

]

end

