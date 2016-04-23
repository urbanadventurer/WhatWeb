##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CA-SiteMinder" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-17
version "0.1"
description "CA SiteMinder - Web Access Management"
website "http://www.ca.com/us/web-access-management.aspx"

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

