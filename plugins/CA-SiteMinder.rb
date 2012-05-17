##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CA-SiteMinder" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "CA SiteMinder - Web Access Management - Homepage: http://www.ca.com/us/web-access-management.aspx"

# ShodanHQ results as at 2012-05-17 #
# 5 for siteminder TARGET

# Google results as at 2012-05-17 #
# 29 for inurl:"smpwservicescgi.exe" ext:exe
# 40 for ext:fcc inurl:"siteminderagent/forms/login.fcc"

# Dorks #
dorks [
'inurl:"smpwservicescgi.exe" ext:exe',
'ext:fcc inurl:"siteminderagent/forms/login.fcc"'
]

# Examples #
examples %w|
https://enterpriselogin.disney.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://sc.oakgov.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://www.eaccountservices.com/pw/pwserv/smpwservicescgi.exe
https://oneweb.mellon.com/pw/smpwservicescgi.exe
https://www.partneragencies.org/siteminderagent/pwcgi/smpwservicescgi.exe
https://healthservices.concentraaps.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://was2.hewitt.com/PSP-prod/siteminderagent/pwcgi/smpwservicescgi.exe
https://secure.agresource.ca/siteminderagent/pwcgi/smpwservicescgi.exe
https://v3.airbus.com/airbusauthentication/pwcgi/smpwservicescgi.exe
https://lami01.lazardnet.com/SmFormAuthPWS/SmPWServicesCGI.exe
https://aimm.wellsfargo.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://smrp-prod.volvo.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://was7.hewitt.com/RFM2/siteminderagent/pwcgi/smpwservicescgi.exe
https://logon-america.econocophillips.com/siteminderagent/pwcgi/smpwservicescgi.exe
https://mdfweb.a1.net/siteminderagent/pwcgi/smpwservicescgi.exe
https://hr-uat.qa.bnymellon.com/pw/pwserv/smpwservicescgi.exe
https://www.guichetunique.ch/siteminderagent/pwcgi/smpwservicescgi.exe
https://www15.deutsche-leasing.de/siteminderagent/pwcgi/smpwservicescgi.exe
https://www.agentinside.com/agentforms/agentlogin.fcc
https://agateway.adp.com/siteminderagent/forms/login.fcc
https://my.nih.gov/siteminderagent/forms/login.fcc
https://applications.labor.ny.gov/siteminderagent/forms/login.fcc
https://team.kc.us.army.mil/siteminderagent/forms/login.fcc
https://www2.kc.us.army.mil/siteminderagent/forms/login.fcc
isrtrain.hqda.pentagon.mil/siteminderagent/forms/login.fcc
|

# Matches #
matches [

# SmPWServicesCGI.exe # Logo HTML
{ :regexp=>/<td><img alt="Logo" src="(\/)?(siteminderagent\/)?(pw\/|pwcgi\/|pwserv\/)?siteminder_logo\.gif" height="44"><\/td><\/tr><\/table>/ },

# HTML Comments
{ :text=>'<!-- SiteMinder Encoding=UTF-8; -->' },
{ :text=>'<!-- SiteMinder Encoding=ISO-8859-1; -->' },
{ :text=>'<tr><td></td></tr></table></td></tr></table></center></div><!--</form> --></body></html>' },

# /siteminderagent/forms/smformscgi.cpp # Comment
{ :regexp=>/\/\* SiteMinder Login Form CGI\s+Copyright \(C\) 1999,2000 Netegrity, Inc\. All rights reserved\./ },

# /siteminderagent/forms/login.fcc # Title
{ :url=>"/siteminderagent/forms/login.fcc", :text=>'<title>SiteMinder Password Services</title>' },

]

end

