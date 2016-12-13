##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HikVision" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-15
version "0.1"
description "HikVision cameras, Digital Video Servers (DVS) and Digital Video Records (DVR)"
website "http://www.hikvisionusa.com/"

# ShodanHQ results as at 2011-07-15 #
# 58,133 for Hikvision-Webs



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^Hikvision-Webs$/ },

]

end

