##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ZTE-IAD" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-01
version "0.1"
description "ZTE IAD (Integrated Access Device)"
website "http://wwwen.zte.com.cn/en/solutions/wireless/"

# ShodanHQ results as at 2011-11-01 #
# 13,600 for Mini web server ZTE

# Google results as at 2011-11-01 #
# 9 for "Please login to continue" "Username" "Password" "ZTE Corporation" "All rights reserved"

# Dorks #
dorks [
'"Please login to continue" "Username" "Password" "ZTE Corporation" "All rights reserved"'
]



# Matches #
matches [

# Version Detection # HTTP Server Header
# Also used by other ZTE devices
{ :certainty=>75, :search=>"headers[server]", :version=>/^Mini web server ([^\s]+) ZTE corp 20[\d]{2}\.$/ },

# /image/banner_I532.jpg
{ :model=>"I532", :url=>"/image/banner_I532.jpg", :md5=>"b7b298d358d9c0ae59224a1c3d3c5585" },

# /image/I202.gif
{ :model=>"I202", :url=>"/image/I202.gif", :md5=>"68b697d421f07bf16f27ac0d44410f05" },

# /image/banner_top.jpg
{ :model=>"ZXV10 I508C", :url=>"/image/banner_top.jpg", :md5=>"b968f243974f9e97b8a9e71bfaa25c83" },

# The I532 model also contains the logo for ZXV10 I508C at /image/banner_top.jpg
# Perhaps ZTE left the old ZXV10 I508C image there by accident as it isn't used

]

end

