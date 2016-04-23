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
description "The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards."
website "http://httpd.apache.org/"

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



# Matches #
matches [

# Default page # Default title
{:text=>"<title>Test Page for Apache Installation</title>", :string=>"Default" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>", :string=>"Default" },

# Default page # Default HTML
{:text=>"<html><body><h1>It works!</h1></body></html>", :string=>"Default" },
{:text=>"<html>Apache is functioning normally</html>", :string=>"Default" },
{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>", :string=>"Default" },
{ :text=>"Apache is working on your cPanel<sup>&reg;</sup> and WHM&#8482; Server", :string=>"Default" },

# /icons/apache_pb.gif
{ :url=>"/icons/apache_pb.gif", :md5=>"48bc8b181b36c9289866a2e30f6afedd" },

# /icons/apache_pb2.gif # 2.x
{ :url=>"/icons/apache_pb2.gif", :md5=>"36ccabeb1ad841c6af37660c3865a9c9", :version=>"2.x" },
{ :url=>"/icons/apache_pb2.gif", :md5=>"726dac78d3a989a360fc405452a798ee", :version=>"2.2" },

# Headers
{:regexp=>/^Apache/i,  :search=>"headers[server]", :name=>"HTTP Server Header"},
{:version=>/^Apache\/([\d\.]+)/i, :search=>"headers[server]", :name=>"HTTP Server Header"},
{:certainty=>75, :module=>"mod_security", :regexp=>/^NOYB$/, :search=>"headers[server]"},
{:certainty=>75, :name=>"htacess WWW-Authenticate realm", :search=>"headers[www-authenticate]", :regexp=>/Basic realm="htaccess password prompt"/},


]

# Passive #
def passive
	m=[]

	# HTTP Server Header # Apache
	if @headers["server"] =~ /^Apache/i

		# Module Detection
		m << { :module=>@headers["server"].scan(/[\s](mod_[^\s^\(]+)/).flatten } if @headers["server"] =~ /[\s](mod_[^\s^\(]+)/
		# proxy_html Module Detection
		m << { :module=>@headers["server"].scan(/[\s](proxy_html\/[^\s]+)/).flatten } if @headers["server"] =~ /[\s](proxy_html\/[^\s]+)/

	end

	# HTTP Server Header # Apache WebSnmp module
	if @headers["server"] =~ /^WebSnmp Server Httpd\/([\d.]+)$/
		m << { :module=>"WebSnmp/"+@headers["server"].scan(/^WebSnmp Server Httpd\/([\d.]+)$/).flatten.first.to_s }
	end

	# x-mod-pagespeed Header # mod_pagespeed module
	m << { :module=>"mod_pagespeed/"+@headers["x-mod-pagespeed"].scan(/^([\d\.]+-[\d]{3})$/).flatten.first.to_s } if @headers["x-mod-pagespeed"] =~ /^([\d\.]+-[\d]{3})$/
	
	# Return passive matches
	m
end

end

