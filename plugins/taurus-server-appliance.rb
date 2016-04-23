##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Taurus-Server-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-19
version "0.1"
description "The Taurus Server Appliance is an all-in-one networking device solution for the small to midsize business."
website "http://www.celestix.com/"

# 2 results for "Welcome to Taurus" "Taurus administration UI" intitle:"The Taurus Server Appliance"

# Dorks #
dorks [
'"Welcome to Taurus" "Taurus administration UI" intitle:"The Taurus Server Appliance"'
]



# Matches #
matches [

# Default title
{ :certainty=>75, :text=>'<title>The Taurus Server Appliance</title>' },

# Welcome heading
{ :text=>'<b><font color=#FFFFFF>Welcome to Taurus </font></b>' },

# Version Detection
{ :version=>/<div align=center><font size=-2 color=#FFFFFF>Software Version : CeLinuX-([\d\.]+)<\/font><\/div>/ },

]

end


