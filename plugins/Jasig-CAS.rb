##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jasig-CAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-12
version "0.1"
description "Jasig Central Authentication Service (CAS) is an authentication system originally created by Yale University to provide a trusted way for an application to authenticate a user. - Homepage: http://www.jasig.org/cas"

# ShodanHQ results as at 2011-09-12 #
# 670 for cas/login
#  29 for cas_security_check

# Google results as at 2011-09-12 #
# 348 for "Powered by Jasig Central Authentication Service"
# 124 for inurl:"cas/login?service="

# Dorks #
dorks [
'"Powered by Jasig Central Authentication Service"',
'inurl:"cas/login?service="'
]

# Examples #
examples %w|
77.43.2.78:8080/cas/login
cms.cugb.edu.cn/cas/login
mystateonline.sdstate.edu/cas/login
mycourses.msstate.edu
bloomington.in.gov/login/
https://mon.armax.ru/cas/login
https://lycees.netocentre.fr/cas/login
https://www.lavoroelegalita.it/cas/login
https://catalog.nypl.org/iii/cas/login
https://login.unl.edu/cas/login
https://idp.universite-lyon.fr/cas/login
https://cas.evergreen.edu/cas/login
https://cas.insa-rouen.fr/cas/login
https://idp.universite-lyon.fr/cas/login
https://intranet.reidhall.com:8443/cas/login
https://becvert.net/cas/login
https://one.asburyseminary.edu
https://signin.bradley.edu/cas/login
https://su-sso.strathmore.edu/cas-prd/login
https://portal.tacomacc.edu/cas/login
https://id1.asyx.com/cas/login
|

# Matches #
matches [

# Version Detection # Powered by link
{ :version=>/<p>Powered by <a href="http:\/\/www\.ja-?sig\.org\/(products\/)?cas">Jasig Central Authentication Service ([^<^\s]+)<\/a><\/p>/, :offset=>1 },

# Title
{ :text=>'<title>CAS &#8211; Central Authentication Service</title>' },

# HTML Comment
{ :text=>'<!-- Congratulations on bringing CAS online!  The default authentication handler authenticates where usernames equal passwords: go ahead, try it out.  -->' },

# Powered by link
{ :text=>'<p>Powered by <a href="http://www.jasig.org/cas">Jasig Central Authentication Service</a></p>' },

]

end

