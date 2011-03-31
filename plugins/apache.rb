##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.6 #
# Updated module detection
##
# Version 0.5 #
# Added module detection
##
# Version 0.4 #
# Combined Apache and Apache default pages plugins
##
Plugin.define "Apache" do
author "Andrew Horton & Brendan Coles"
version "0.6"
description "The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. - homepage: http://httpd.apache.org/"

# Google results as at 2010-10-26 #
# 190 for intitle:"Test Page for Apache Installation"

# ShodanHQ results as at 2010-10-26 #
# 8,146,697 for "server: Apache"
# 217,2233 for "server: mod_ssl"
# 691,816 for "server: mod_auth_passthrough"
# 753,880 for "server: mod_bwlimited"
# 177,808 for "Server: mod_jk"
# 177,808 for "Server: mod_jk"
# 25,076 for "Server: mod_fcgid"
# 165,191 for "Server: mod_log_bytes"
# 75,655 for "Server: mod_gzip"
# 559 for for "Server: mod_security"
# 450,117 for "Server: mod_perl"
# 154,334 for "Server: mod_python"
# 87,454 for "Server: mod_fastcgi"
# 45,696 for "Server: mod_psoft_traffic"
# 34,854 for "Server: mod_macro"
# 61,692 for "Server: mod_throttle"
# 3,553 for NOYB

# Examples #
examples %w|
www.eu.archive.org
121.72.245.103
202.89.39.193
113.21.226.227
commgrad.uky.edu
mworlds.lbl.gov
www.nhls.gov.za
https://ls.berkeley.edu
174.132.146.118
62.183.43.9
72.245.251.34
77.104.156.195
76.74.247.227
67.227.193.19
173.225.80.12
130.206.76.199
203.27.92.33
69.163.142.76
209.237.234.71
122.117.86.79
64.91.244.64
96.9.55.205
77.91.206.23
206.251.255.137
84.40.53.47
66.118.165.57
66.194.79.90
219.94.214.128
74.53.210.56
69.161.152.1
46.43.50.77
109.123.83.175
208.43.51.173
209.90.225.114
174.123.148.250
208.43.165.236
174.36.241.50
129.121.100.8
80.84.255.150
76.12.54.162
69.73.146.200
66.113.103.79
69.163.219.199
212.94.66.59
202.201.242.91
|

# Matches #
matches [

# Default page # Default title
{:text=>"<title>Test Page for Apache Installation</title>", :string=>"Default" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>", :string=>"Default" },

# cPanel # Default Page
{ :text=>'<p class="troubleshoot">It may be possible to restore access to this site by <a href="http://www.cpanel.net/docs/dnscache/cleardns.html">following these instructions</a> for clearing your dns cache.</p>', :string=>"cPanel Default" },

# Default page # Default HTML
{:text=>"<html><body><h1>It works!</h1></body></html>", :string=>"Default" },
{:text=>"<html>Apache is functioning normally</html>", :string=>"Default" },
{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>", :string=>"Default" },

# Shortcut Icon # Apache on Redhat
{ :url=>"/favicon.ico", :md5=>"71e30c507ca3fa005e2d1322a5aa8fb2" },

# Shortcut Icon # Apache (seen on CentOS/Debian/Fedora)
{ :url=>"/favicon.ico", :md5=>"dcea02a5797ce9e36f19b7590752563e" },

# Shortcut Icon # Apache on Red Hat/Fedora
{ :url=>"/favicon.ico", :md5=>"d99217782f41e71bcaa8e663e6302473" },

# Shortcut Icon # Apache Tomcat
{ :url=>"/favicon.ico", :md5=>"4644f2d45601037b8423d45e13194c93" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Apache/i

		# Server Detection
		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^Apache\/([\d\.]+)/i) } if @meta["server"] =~ /^Apache\/([\d\.]+)/i

		# Module Detection
		m << { :module=>@meta["server"].scan(/[\s](mod_[^\s]+)/) } if @meta["server"] =~ /[\s](mod_[^\s]+)/

	end

	# mod_security
	m << { :module=>"mod_security" } if @meta["server"] == "NOYB"

	# mod_pagespeed
	m << { :module=>"mod_pagespeed\/"+@meta["x-mod-pagespeed"].scan(/^([\d\.]+-[\d]{3})$/).to_s } if @meta["x-mod-pagespeed"] =~ /^([\d\.]+-[\d]{3})$/

	# Return passive matches
	m
end

end

