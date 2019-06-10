##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Hyperic-HQ"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2012-08-19
  "Andrew Horton", # v0.2 # 2019-07-10 # Removed Homepage: from the website
]
version "0.2"
description "Hyperic HQ - platform for custom web application monitoring and performance management in physical, virtual, and cloud environments."
website "http://www.vmware.com/products/application-platform/vfabric-hyperic.html"

# Default Port # 7443
# Default User # hqadmin

# Google results as at 2012-08-19 #
# 4 for intitle:"Sign In - Hyperic" "Please enter your username and password to sign in"

# ShodanHQ results as at 2012-08-19 #
# 95 for /app/login jsessionid

# Dorks #
dorks [
'intitle:"Sign In - Hyperic" "Please enter your username and password to sign in"'
]



# Matches #
matches [

# /ui_docs/DOC/index.html # Version Detection
{ :url=>"/ui_docs/DOC/index.html", :version=>/<title>DOCS\d+ \(vFabric Hyperic ([^\)]+)\)/ },

# /app/login # Login Page
{ :text=>'<a id="screencastLink" href="http://www.hyperic.com/demo/screencasts.html" target="_blank" title="Screencasts">' },

# Location Header # /app/login;jsessionid=
{ :search=>"headers[location]", :regexp=>/\/app\/login;jsessionid=/ },

]

end

