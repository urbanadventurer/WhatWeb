##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jasig-CAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-12
version "0.1"
description "Jasig Central Authentication Service (CAS) is an authentication system originally created by Yale University to provide a trusted way for an application to authenticate a user."
website "http://www.jasig.org/cas"

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

