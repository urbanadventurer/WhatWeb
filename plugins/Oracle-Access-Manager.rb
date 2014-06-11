##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Access-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-02-06
version "0.1"
description "Oracle Access Manager - Comprehensive Access Management for Applications, Data, and Web Services -H omepage: http://www.oracle.com/us/products/middleware/identity-management/access-management/overview/index.html"

# ShodanHQ results as at 2013-02-05 #
# 285 for ObSSOCookie
# 110 for ObSSOCookie obrareq.cgi

# Google results as at 2013-02-05 #
# 39 for inurl:"obrareq.cgi"

# Dorks #
dorks [
'inurl:"obrareq.cgi"'
]



# Matches #
matches [

# Footer # Version Detection
{ :version=>/<p id="footerVersion">Oracle Access Manager Version: ([^\s]+)<\/p>/ },

# ObSSOCookie Cookie
{ :search=>"headers[set-cookie]", :regexp=>/ObSSOCookie=[^;]+;/, :certainty=>75 },

# Location Header # obrareq.cgi
{ :search=>"headers[location]", :regexp=>/obrareq\.cgi/, :certainty=>75 },

]

end

