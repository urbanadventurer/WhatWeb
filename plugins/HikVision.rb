##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HikVision" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-15
version "0.1"
description "HikVision cameras, Digital Video Servers (DVS) and Digital Video Records (DVR) - Homepage: http://www.hikvisionusa.com/"

# ShodanHQ results as at 2011-07-15 #
# 58,133 for Hikvision-Webs

# Examples #
examples %w|
85.44.178.50
221.210.181.168
86.124.67.213
87.126.249.139
113.140.40.37
189.187.163.239
|

# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Hikvision-Webs$/ },

]

end

