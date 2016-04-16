##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Check-Point-SSL-Network-Extender" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-24
version "0.1"
description "SSL Network Extender adds SSL VPN functionality to the IPSec VPN capabilities of VPN-1 gateways"
website "http://www.checkpoint.com/products/ssl_network_ext/"

# ShodanHQ results as at 2011-11-24 #
# 223 for Check Point SVN foundation

# Google results as at 2011-11-24 #
# Lots of false positives for intitle:"Check Point SSL Network Extender"
# 2 for intitle:"Check Point SSL Network Extender HELP" inurl:help_data.html



# Matches #
matches [

# HTTP Header # Server
{ :search=>"headers[server]", :regexp=>/^Check Point SVN foundation$/ },

# / # JavaScript
{ :regexp=>/<script src="cookies\.js"><\/script>[\s]+<script>document\.write\(conn_html\)<\/script>[\s]+<HEAD>/ },

# /help_data.html # Help Page
{ :url=>"/help_data.html", :regexp=>/<meta name=Generator content="Microsoft Word 11 \(filtered\)">[\s]+<title>Check Point SSL Network Extender HELP<\/title>/ },

# /logo.gif
{ :url=>"/logo.gif", :md5=>"a5be381441844d96e70407481e1390b1" },

# Security Gateway # HTML Comment
{ :text=>'<meta name="description" content="Webui Login Page"/>  <!-- changes to this line must be reflected in sfwOverrides.js & lm_home.js -->', :string=>"Security Gateway" },

# / # Security Gateway # Version Detection
{ :version=>/<form autocomplete="off" method="post" action="\/platform\.cgi\?" target="_top">[\s]+<input type="hidden" name="thispage" value="index\.htm">[\s]+<div class="version_div">([^<]+)<\/div>/, :string=>"Security Gateway" },

]

end

