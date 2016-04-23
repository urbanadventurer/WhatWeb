##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symantec-Endpoint-Protection-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-19
version "0.1"
description "Antivirus and personal firewall"
website "http://www.symantec.com/business/endpoint-protection"

# Google results as at 2011-11-19 #
# 2 for intitle:"Symantec Endpoint Protection Manager" "You must have JavaScript enabled to use this Web page."

# Dorks #
dorks [
'intitle:"Symantec Endpoint Protection Manager" "You must have JavaScript enabled to use this Web page."'
]



# Matches #
matches [

# / # web access link
{ :text=>'<tr><td align="left" style="font-family:Arial; font-size:18pt"><b>Symantec Endpoint Protection Manager<br>Web Access</b></td></tr>' },

# / # HTML Comment
{ :text=>'<!-- Now, if it is IE on Windows platform, we check to see which version of JWS is installed -->' },

# /portal/About.jsp # Version Detection
{ :url=>"/portal/About.jsp", :version=>/<div style="font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif; font-size:11px;">Version ([^\s^<]+)<\/div>/ },

]

end

