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

# Examples #
examples %w|
12.171.85.17
60.29.141.71
72.163.7.110
85.205.252.163
98.175.77.81
141.191.16.124
141.191.16.143
141.191.32.122
141.191.32.166
145.20.124.72
157.164.189.75
170.135.72.76
170.135.130.43
170.135.130.96
170.135.218.200
193.109.72.154
202.3.113.20
203.127.145.167
218.32.161.235
207.17.137.111
https://ops13web.nws.noaa.gov/oam/server/obrareq.cgi
http://sso.admbnet.be/oam/server/obrareq.cgi
https://tjenester.sismo.no/oam/server/obrareq.cgi
https://ops13web.nws.noaa.gov/oam/server/obrareq.cgi
https://connect.homehardware.ca/oam/server/obrareq.cgi
https://nu.edu.kz/oam/server/obrareq.cgi
https://login.oracle.com/oam/server/obrareq.cgi
https://sso.erau.edu/oam/server/obrareq.cgi
|

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

