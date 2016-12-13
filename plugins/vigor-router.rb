##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vigor-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-25
version "0.1"
description "Vigor router"
website "http://www.draytek.com/user/PdInfoDetail.php?Id=20"

# ShodanHQ results as at 2012-03-25 #
# 2,640 for Vigor
# 2,620 for WWW-Authenticate Vigor
#    33 for VigorAccess



# Matches #
matches [

# Model Detection # HTTP Server Header
{ :search=>"headers[server]", :model=>/^(VigorAccess) Web Server$/ },

# Model Detection # WWW-Authenticate
{ :search=>"headers[www-authenticate]", :model=>/^Basic realm="(Login to )?Vigor ([\d]+)"$/, :offset=>1 },

]

end

