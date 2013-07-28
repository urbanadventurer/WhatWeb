##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Intrinsyc-deviceWEB" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-07-28
version "0.1"
description "Intrinsyc deviceWEB - a web server specialized for embedded devices - Homepage: http://www.intrinsyc.com/"

# ShodanHQ results # 2013-07-28
# 82 for Intrinsyc deviceWEB

# Examples #
examples %w|
74.223.225.146
172.8.252.98
76.195.188.202
216.110.84.112
216.110.84.115
98.23.254.117
12.48.177.243
209.74.69.6
108.201.38.81
173.185.152.229
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^Intrinsyc deviceWEB v([\d\.]+)$/ },

]

end

