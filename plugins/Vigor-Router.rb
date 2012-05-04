##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vigor-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-25
version "0.1"
description "Vigor router - Homepage: http://www.draytek.com/user/PdInfoDetail.php?Id=20"

# ShodanHQ results as at 2012-03-25 #
# 2,640 for Vigor
# 2,620 for WWW-Authenticate Vigor
#    33 for VigorAccess

# Examples #
examples %w|
62.182.225.125
187.45.58.4
203.128.85.98
80.249.7.194
187.45.50.66
187.45.51.4
187.45.60.195
62.182.225.124
187.45.59.18
78.32.229.185
190.3.13.30
193.59.64.58
62.77.214.20
217.113.143.227
79.170.78.94
200.99.137.130
189.127.75.221
65.42.180.61
|

# Matches #
matches [

# Model Detection # HTTP Server Header
{ :search=>"headers[server]", :model=>/^(VigorAccess) Web Server$/ },

# Model Detection # WWW-Authenticate
{ :search=>"headers[www-authenticate]", :model=>/^Basic realm="(Login to )?Vigor ([\d]+)"$/, :offset=>1 },

]

end

