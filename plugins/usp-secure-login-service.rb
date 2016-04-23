##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "USP-Secure-Login-Service" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "United Security Providers (USP; previously known as Tetrade) Secure Login Service (SLS) Framework. The SLS works alongside the USP Secure Entry Server (SES) which functions as a Reverse-Proxy and Web Application Firewall (WAF) and also fulfills the role of user authentication."
website "http://www.united-security-providers.com/"

# The United Security Providers (USP; previously known as Tetrade) components Secure Entry Server (SES) and Secure Login Service (SLS) share their tasks in order to adhere to the principles of separation of powers. The task of the SES is to recognize non-authenticated users and to ensure that they are authenticated by the SLS (Access Control Enforcement Function). The task of the SLS is to perform the authentication (Authentication and Access Control Decision Function). The communication between SES and SLS is based on custom HTTP headers. The SES sends the desired user login type to the SLS which performs the authentication. Once the login is completed, the SLS signals the success or failure of the process back to the SES. According to this, the SES determines the access rights of the user.

# Google results as at 2011-08-25 #
# 21 for intitle:"Secure Login Service"
#  3 for inurl:"sls/auth?RequestedPage"

# Dorks #
dorks [
'inurl:"sls/auth?RequestedPage"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Optional: If browser does not support Javascript, load URL xyz -->' },
{ :text=>'<!-- SLS JavaScripts -->' },

# Form HTML
{ :text=>'<form action="auth" method="post" name="LoginForm" onsubmit="return checkFormSubmit();" >' },

# input name="currentRequestedPage" type="hidden"
{ :certainty=>75, :regexp=>/<input name="currentRequestedPage" type="hidden" value="[^"]+" \/><\/form>/ },

# slsstatus Header
{ :search=>"headers[slsstatus]", :string=>/^([\d]+)$/ },

# SLSLanguage Cookie
{ :search=>"headers[set-cookie]", :regexp=>/SLSLanguage=([a-z]{2,3});/ },

# SCDID_S Cookie # This may indicate the presence of USP SES rather than USP SLS
# It may also belong to both. It's hard to confirm without access to the source.
{ :search=>"headers[set-cookie]", :module=>"zzzzzz", :regexp=>/SCDID_S=[^;^\s^\$]{54}\$\$;/ },

]

end

