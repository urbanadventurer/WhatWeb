##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hyperic-HQ" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-19
version "0.1"
description "Hyperic HQ - platform for custom web application monitoring and performance management in physical, virtual, and cloud environments. - Homepage: Homepage: http://www.vmware.com/products/application-platform/vfabric-hyperic.html"

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

# Examples #
examples %w|
65.124.140.127
184.73.103.125
91.230.238.142
209.59.2.196
198.41.41.61
184.172.45.21:8080
64.27.68.102
50.17.18.140
209.59.2.193
mon.tedata.net
hyperic.econocompu.com
int103.vodafone.de
hyperic.tulane.edu
|

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

