##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
# Added WWW-Authenticate match
##
Plugin.define "NetBotz-Network-Monitoring-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.2"
description "NetBotz monitoring and management web front end - homepage: http://www.netbotz.com/products/index.html"

# Google results as at 2010-07-20 #
# 12 for intitle:"Device Status Summary Page" -demo
# 21 for intitle:"netbotz appliance" -inurl:.php -inurl:.asp -inurl:.pdf -inurl:securitypipeline -announces

# Examples #
examples %w|
155.101.3.213
216.157.144.161
209.234.101.131
aisvc.com/ext/netbotz/
155.101.3.212
granthandy.com
netbot-m1-1.inscc.utah.edu
netbot-m2-1.inscc.utah.edu
netbot-m2-2.inscc.utah.edu
155.101.3.211
129.219.60.184
155.101.3.210
198.182.247.199/pages/index.html
bots1.medhosters.com
nb500.optrics.net
24.24.69.166:8083/pages/index.html
71.168.66.58:5190/pages/index.html
|

# Matches #
matches [

# Default Title
{ :regexp=>/<TITLE>NetBotz( Network Monitoring) Appliance - [^<]*<\/TITLE>/ },

# Default CSS HTML
{ :text=>'<LINK REL="StyleSheet" TYPE="text/css" HREF="/netbotz.css">' },

# Applet Launch Page # Default HTML Comment
{ :text=>'<!-- Launch the NetBotz Applications.  This will require Java 1.3.0 OR ANYTHING NEWER -->' },

# Logo Frame # Default logo HTML
{ :text=>'<a href="http://www.netbotz.com" target="_top"><img border="0" src="/colorlogo.gif"></a>' },

# Status Page # Default Title
{ :text=>'	<TITLE>Device Status Summary Page</TITLE>' },

# Version Detection # statusHeader.html
{ :url=>"/statusHeader.html", :version=>/<a href="http:\/\/updates.netbotz.com\/releases\/([\d\.]+)\/install.html" target="_instAV">\(Install Advanced View Application\)<\/a>/ },

]

# Passive #
def passive
	m=[]

	# HTTP WWW Authenticate header
	m << { :name=>'HTTP WWW Authenticate header' } if @meta['www-authenticate'] =~ /NetBotz Appliance/

	# Return Passive Matches
	m
end

end

