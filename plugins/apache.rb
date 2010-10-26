##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache" do
author "Andrew Horton"
version "0.4"
description "The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. - homepage: http://httpd.apache.org/"

# 190 results for intitle:"Test Page for Apache Installation" @ 2010-10-26
# About 8146697 ShodanHQ results for "server: Apache" @ 2010-10-26
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
|

matches [

# Default page # Default title
{:text=>"<title>Test Page for Apache Installation</title>", :modules=>"Default" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>", :modules=>"Default" },

# Default page # Default HTML
{:text=>"<html><body><h1>It works!</h1></body></html>", :modules=>"Default" },
{:text=>"<html>Apache is functioning normally</html>", :modules=>"Default" },
{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>", :modules=>"Default" },

# Shortcut Icon # Apache on Redhat
{ :url=>"/favicon.ico", :md5=>"71e30c507ca3fa005e2d1322a5aa8fb2" },

# Shortcut Icon # Apache (seen on CentOS/Debian/Fedora)
{ :url=>"/favicon.ico", :md5=>"dcea02a5797ce9e36f19b7590752563e" },

# Shortcut Icon # Apache on Red Hat/Fedora
{ :url=>"/favicon.ico", :md5=>"d99217782f41e71bcaa8e663e6302473" },

# Shortcut Icon # Apache Tomcat
{ :url=>"/favicon.ico", :md5=>"4644f2d45601037b8423d45e13194c93" },

]

# HTTP Header
def passive
	m=[]

	# Server
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /[^\r^\n]*Apache[^\r^\n]*/i
	m << { :name=>"HTTP Server Header" } if @meta["Server"].to_s =~ /[^\r^\n]*Apache[^\r^\n]*/i

	# Server # Version detection
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i) } if @meta["server"].to_s =~ /[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i
	m << { :version=>@meta["Server"].to_s.scan(/[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i) } if @meta["Server"].to_s =~ /[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i

	m

end

end

