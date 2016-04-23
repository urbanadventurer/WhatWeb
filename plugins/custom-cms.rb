##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Updated version detection
##
Plugin.define "Custom-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.2"
description "Custom CMS Gaming is a Content Management System geared towards all Gamers that would like to maintain and create fully functional gaming sources. "
website "http://www.customcms.net/"

# Google results as at 2010-09-03 #
# 165 for "powered by CCMS"

# Dorks #
dorks [
'"powered by CCMS"'
]



# Matches #
matches [

# Default title
{ :text=>' - Powered by CCMS</title>', :certainty=>75 },

# Meta Generator
{ :text=>'<meta name="generator" content="CustomCMS Gaming" />' },

# Version Detection # Logo alt text
{ :version=>/power.png" border="0" style="margin-top: 7px;" alt="" title="Powered by CCMS v([\d\.]+)" \/><\/a>/ },

]

end

