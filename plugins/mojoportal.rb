##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
# Version 0.2 # 2011-03-04 #
# Added match for setup page
##
Plugin.define "mojoPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-09 
version "0.3"
description "mojoPortal is Free and Open Source. Create accessible, standards compliant web pages and content right in the browser. Powerful content management, easy to learn, easy to use."
website "http://www.mojoportal.com/"

# Google results as at 2011-03-04 #
# 392 for "Powered by mojoPortal"
# 22  for "Welcome to mojoPortal Setup" intitle:"mojoPortal Setup"

# Dorks #
dorks [
'"Powered by mojoPortal"'
]

# Matches #
matches [

# GHDB: "Powered by mojoPortal"
{ :certainty=>25, :ghdb=>'"Powered by mojoPortal"' },

# Powered by text
{ :text=>"<a href='http://www.mojoportal.com' >Powered by mojoPortal</a>" },

{ :text=>"<a href='http://www.mojoportal.com'  title='mojoPortal.com'>Powered by mojoPortal</a>" },

# Default Head+Title HTML
{ :certainty=>25, :regexp=>/<head id="ct[0-9]+_Head[0-9]+"><title>/i },

# Setup Page # Default logo HTML
{ :text=>'	<img src="../Data/SiteImages/mojoportal-logo-med.gif" alt="mojoPortal Content Management System" />' },

# Setup Page # Default CSS
{ :text=>'<link id="Link1" runat="server" rel="stylesheet" href="../Data/style/setup.css" type="text/css"  />' },

]

end

