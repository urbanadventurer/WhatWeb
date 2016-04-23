##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Skillsoft-Skillport-LMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-30
version "0.1"
description "Skillsoft Skillport - learning management system (LMS)"
website "http://www.skillsoft.com/products/skillport/"

# ShodanHQ results as at 2012-05-30 #
# 43 for SP70FE

# Google results as at 2012-05-30 #
# 247 for site:skillport.com inurl:"login.action"

# Dorks #
dorks [
'site:skillport.com inurl:"login.action"'
]



# Matches #
matches [

# Login Page # table id="loginwrapper" # Version Detection
{ :version=>/<table id="loginwrapper">\s*<tr><td width="10%"><\/td>\s*<td width="80%"  align="left" class="v">v ([^\s]+)<\/td>/ },

# Login Page # Help Link
{ :text=>'<a href="javascript:void(0);showContextSpecificHelp(\'/skillportfe/help/en_US/learnerHelp/23386.htm\');"' },

# Login Page # Logo HTML # Customer Name Detection
{ :string=>/<table border="0" width="100%" id="logobanner">\s+<tr width="100%">\s+<td  width="82%">\s+<img src="https?:\/\/customer\.skillport\.com\/spcustom\/([^\/]+)\/[^"]+" alt="([^"]+) ?Logo"/, :offset=>0 },
{ :string=>/<table border="0" width="100%" id="logobanner">\s+<tr width="100%">\s+<td  width="82%">\s+<img src="https?:\/\/customer\.skillport\.com\/spcustom\/([^\/]+)\/[^"]+" alt="([^"]+) ?Logo"/, :offset=>1 },

# Login Page # Powered by logo HTML
{ :regexp=>/<div id="poweredbylogo">\s+<img src ="\/skillportfe\/resources\/default\/images\/poweredby\.gif" \/>/ },

# Set-Cookie # SP[0-9]{2}FE
# The two digits represent the major and minor version numbers
# For example: SP71FE is SkillPort version 7.1.x
{ :search=>"headers[set-cookie]", :regexp=>/SP[5-7]\dFE=\d+\.\d+\.\d+/ },

# HTTP Header # X-SP-FE
# I have no idea what this string represents but it's unique for every account
# In the form of /pvsp[0-9]{2}[a-z0-9]+(-[0-9]+)?/
# Where the first two digits appear to be the Skillport version
# Followed by a few alphanum chars which sometimes represent the company name
{ :search=>"headers[x-sp-fe]", :string=>/^(.+)$/ },

]

end

