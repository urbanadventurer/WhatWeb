##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SiteCaddy" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-10
version "0.1"
description "Site Caddy offers a suite of online tools for marketing, content management, e-commerce and hosting"
website "http://info.sitecaddy.com/mysitecaddy/site3/"

# Google results as at 2012-04-10 #
# 258 for inurl:"mysitecaddy/site"|inurl:"mysitecaddy/site3"
# 207 for "Powered by SiteCaddy.com"

# More Sites #
# http://info.sitecaddy.com/mysitecaddy/site3/clientportfolio.htm

# Dorks #
dorks [
'inurl:"mysitecaddy/site"|inurl:"mysitecaddy/site3"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- SECTION: bottom branding -->' },
{ :text=>'<!-- write title and meta tags -->' },

# ul class siteCaddyMenu
{ :text=>'<ul class="siteCaddyMenu menuLevel0 bottomNav" id="primaryNav">' },

# Powered by Link
{ :text=>'<a href="http://www.sitecaddy.com" title="Powered by SiteCaddy.com">' },

# Powered by logo
{ :text=>'<img src="/mysitecaddy/assets3/common/images/poweredbysitecaddy.gif" alt="Powered by SiteCaddy.com">' },

]

end

