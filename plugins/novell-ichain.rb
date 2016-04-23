##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Novell-iChain" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-06-04
version "0.1"
description "Novell iChain is an integrated solution designed to securely link all the disparate elements of your network into one secure infrastructure. The iChain solution leverages Novell's Internet Caching System (ICS) to provide secure access to company information and databases. On the back end, iChain leverages NDS eDirectory to serve as a single repository of users' authentication information and access control privileges."
website "http://support.novell.com/techcenter/articles/ana20010201.html"

# ShodanHQ results as at 2012-06-03 #
# 961 for X-Error-Info: Host name received is not for this web site
#  42 for Novell iChain



# Matches #
matches [

# img src="ICHAINErrors/alertbar.gif"
{ :text=>'<td height="20" align="center"><img height="8" width="445" src="ICHAINErrors/alertbar.gif"></td>' },

# Your old browser does not support a 302 Redirect
{ :text=>'<HTML><HEAD><TITLE>Novell iChain</TITLE></HEAD><BODY><b><p>Your old browser does not support a 302 Redirect.</b></BODY></HTML>' },

# HTTP request is being redirected to HTTPS
{ :text=>'<HTML><HEAD><TITLE>Novell Proxy</TITLE></HEAD><BODY><b><p>HTTP request is being redirected to HTTPS.</b></BODY></HTML>' },

# X-Error-Info: Host name received is not for this web site
{ :search=>"headers[X-Error-Info]", :regexp=>/Host name received is not for this web site/ },

]

end

