##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "Quick_Cms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.2"
description "Freeware, fast and easy to customize Content Management System."
website "http://opensolution.org/quick.cms,en,10.html"

# Google results as at 2010-08-30 #
# 298 for "powered by Quick.Cms"

# Dorks #
dorks [
'"powered by Quick.Cms"'
]



# Matches #
matches [

# Admin Page # Default Title
{ :text=>'  <title>Admin - Quick.Cms - simple content management system</title>' },

# Admin Page # Default JavaScript
{ :text=>'    var cfLangNoWord      = "Please fill in all required fields";' },

# Powered by text
{ :text=>'      <div class="foot" id="powered"><a href="http://opensolution.org/">Powered by <strong>Quick.Cms</strong></a></div>' },

# HTML comment text
{ :text=>'        LICENSE REQUIREMENTS - DONT DELETE/HIDE LINK "powered by Quick.Cms" TO www.OpenSolution.org' },

# Meta author
{ :text=>'  <meta name="Author" content="OpenSolution.org" />' },

# Version Detection # Admin Page # Version Footer
{ :version=>/      <div id="version"><a href="http:\/\/opensolution.org\/">Quick.Cms v([\d\.]+)<\/a><\/div>/ },

]

end

