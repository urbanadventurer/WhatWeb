##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tencent-QQ" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Tencent QQ, generally referred to as QQ, is the most popular free instant messaging computer program in Mainland China. As of September 30, 2010, the active QQ users accounts for QQ IM amounted to 636.6 million, possibly making it the world's largest online community. The number of simultaneous online QQ accounts exceeded 100 million."
website "http://www.qq.com/"
# More info: http://en.wikipedia.org/wiki/Tencent_QQ

# ShodanHQ results as at 2011-03-19 #
# 8 for Tencent/HTTP_Magic_Expression



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^HTTP_ME\/\d\.\d Tencent\/HTTP_Magic_Expression$/ },

]

end

