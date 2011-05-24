##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.8 # 2011-05-25 #
# Updated module detection
# Added htaccess www-authenticate realm detection
##
# Version 0.7 # 2011-04-06 #
# Removed favicon matches in favor of /icons/ matches
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
version "0.8"
description "The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. - homepage: http://httpd.apache.org/"

# Google results as at 2010-10-26 #
# 190 for intitle:"Test Page for Apache Installation"

# ShodanHQ results #
# 8,146,697 for "server: Apache"
# 217,2233 for "server: mod_ssl"
# 691,816 for "server: mod_auth_passthrough"
# 753,880 for "server: mod_bwlimited"
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
# 667 for WebSnmp Server Httpd
# 16,566 for proxy_html
# 26 for Basic realm "htaccess password prompt"

# Dorks #
dorks [
'intitle:"Test Page for the Apache HTTP Server on Fedora Core" intext:"Fedora Core Test Page"',
'intitle:"Welcome to Your New Home Page!" "by the Debian release"',
'intitle:"Test Page for Apache" "It Worked!"'
]

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
64.65.225.169
222.229.203.182
93.113.164.198
131.114.79.15
64.199.140.194
95.156.203.82
71.16.105.101
193.34.145.171
12.200.220.2
128.46.106.2
77.106.190.84
213.9.6.84
173.45.242.63
173.212.232.209
92.103.215.34
188.40.108.209
74.114.46.152
209.255.137.144
|

# Matches #
matches [

# Default page # Default title
{:text=>"<title>Test Page for Apache Installation</title>", :string=>"Default" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>", :string=>"Default" },

# Default page # Default HTML
{:text=>"<html><body><h1>It works!</h1></body></html>" },
{:text=>"<html>Apache is functioning normally</html>" },
{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>" },
{ :text=>"Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server" },

# /icons/apache_pb2.gif
{ :url=>"/icons/apache_pb.gif", :md5=>"48bc8b181b36c9289866a2e30f6afedd" },
{ :url=>"/icons/apache_pb2.gif", :md5=>"36ccabeb1ad841c6af37660c3865a9c9", :version=>"2" },
{ :url=>"/icons/apache_pb2.gif", :md5=>"726dac78d3a989a360fc405452a798ee", :version=>"2.2" },

]

# Passive #
def passive
	m=[]

	# Apache HTTP Server Header
	if @meta["server"] =~ /^Apache/i

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^Apache\/([\d\.]+)/i) } if @meta["server"] =~ /^Apache\/([\d\.]+)/i

		# Module Detection
		m << { :module=>@meta["server"].scan(/[\s](mod_[^\s^\(]+)/) } if @meta["server"] =~ /[\s](mod_[^\s^\(]+)/

		# proxy_html Module Detection
		m << { :module=>@meta["server"].scan(/[\s](proxy_html\/[^\s]+)/) } if @meta["server"] =~ /[\s](proxy_html\/[^\s]+)/

	end

	# Apache WebSnmp module
	if @meta["server"] =~ /^WebSnmp Server Httpd\/([\d.]+)$/
		m << { :module=>"WebSnmp/"+@meta["server"].scan(/^WebSnmp Server Httpd\/([\d.]+)$/).to_s }
	end

	# mod_security
	m << { :certainty=>75, :module=>"mod_security" } if @meta["server"] =~ /^NOYB$/

	# x-mod-pagespeed Header # mod_pagespeed
	m << { :module=>"mod_pagespeed/"+@meta["x-mod-pagespeed"].scan(/^([\d\.]+-[\d]{3})$/).to_s } if @meta["x-mod-pagespeed"] =~ /^([\d\.]+-[\d]{3})$/

	# WWW-Authenticate: Basic realm="htaccess password prompt"
	m << { :certainty=>75, :name=>"htacess WWW-Authenticate realm" } if @meta["www-authenticate"] =~ /Basic realm="htaccess password prompt"/

	# Return passive matches
	m
end

end

