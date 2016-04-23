##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "My-WebCamXP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-24
version "0.2"
description "WebCamXP web interface"
website "http://www.webcamxp.com"

# Google results as at 2010-07-24 #
# 332 Google results for "powered by webcamXP"
# 56 Google results for intitle:"my webcamXP server!" inurl:":8080"

# ShodanHQ results as at 2010-07-24 #
# About 94 Shodan results for Server:webcamXP

# Dorks #
dorks [
'"powered by webcamXP"',
'intitle:"my webcamXP server!" inurl:":8080"'
]



# Matches #
matches [

# Default Title
{ :text=>'<html><head><title>my webcamXP server!</title>' },

# Default h1 Heading HTML
{ :text=>'			<h1><span>webcamXP 5</span></h1>' },

# Default JavaScript
{ :text=>"newWindow = window.open(camstr, winstr, 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=' + width + ',height=' + height);" },

# Default Logo HTML
{ :text=>'<br><br><table border="1" cellpadding="0" cellspacing="0" bordercolor="#579A48"><tr><td><a href="http://www.webcamXP.com"><img src="http://www.darkwet.net/banners/webcamxp2.gif" width="88" height="31" border="0"></a>' },

# 401 unauthorized error page
{ :text=>'<html><head><title>webcamXP :: unauthorized access</title></head>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="webcamXP [^"]{0,15}v([\d\.]+)">/ },

# Version Detection # Link HTML
{ :version=>/mXP.com" target="_blank">webcamXP 5<\/a> v([\d\.]+)/ },

# Version Detection # Powered by text
{ :version=>/powered by <a href="http:\/\/www.webcamXP.com" target="_blank">webcamXP<\/a>[\ \d]* v([\d\.a-z\ ]+)<\/div>/ },

# Version Detection # Powered by text
{ :version=>/<\/td><\/tr><\/table><br>powered by webcamXP PRO[\ \d]* v([\d\.]+)<br><br><br><\/font><\/center><\/body><\/html>/ },

# Version Detection # Powered by text
{ :version=>/			powered by <a href="http:\/\/www.webcamxp.com" title="www.webcamxp.com">webcamxp 5<\/a> v([\d\.]+)/ },

# webcamXP 5 # 401 unauthorized error page
{ :version=>/powered by <a href="http:\/\/www.webcamXP.com" target="_blank">webcamXP 5<\/a> v([\d\.]+)<\/a>/ },

]

end

