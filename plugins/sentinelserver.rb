##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SentinelServer"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-09-15
]
version "0.1"
description "Monitor application performance and availability"
website "http://www.ymor.eu/"

# ShodanHQ results as at 2011-09-15 #
# 6 for SentinelServer

# Google results as at 2011-09-15 #
# 3 for intitle:"SentinelServer Login" "SentinelServer Login"

# Dorks #
dorks [
'intitle:"SentinelServer Login" "SentinelServer Login"'
]



# Matches #
matches [

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^SentinelServer/ },

]

end

