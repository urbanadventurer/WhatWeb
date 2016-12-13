##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iPeer" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-25
version "0.1"
description "iPeer - a web-based platform/database independent application to develop and deliver peer evaluations - Requires PHP"
website "http://ipeer.ctlt.ubc.ca/trac"

# ShodanHQ results as at 2012-08-25 #
# 2 for 2 for loginout/login IPEER

# Google results as at 2012-08-25 #
# 26 for "Powered by iPeer and TeamMaker - Created by UBC and Rose-Hulman"
# 20 for intitle:"iPeer V2 with TeamMaker"

# Dorks #
dorks [
'"Powered by iPeer and TeamMaker - Created by UBC and Rose-Hulman"',
'intitle:"iPeer V2 with TeamMaker"'
]



# Matches #
matches [

# Login Page # Title # Version Detection
{ :version=>/<title>iPeer V(\d) with TeamMaker<\/title>/ },

# Login Page # Footer
{ :text=>'<h1 align="center"><span class="footer">Powered by iPeer and TeamMaker - Created by UBC and Rose-Hulman</span></h1>' },

# Login Page # Version Detection
{ :version=>/<span class="bannerText"><span style='font-size: 120%;'>([^<]+)<\/span>&nbsp;&nbsp;with TeamMaker<\/span><\/td>/ },

# Cookie # IPEER
{ :search=>"headers[set-cookie]", :regexp=>/IPEER=[^;]+;/ },

]

end

