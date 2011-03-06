##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MHttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.1"
description "MHTTPD stands for Minimal Hypertext Transport Protocol Daemon. MHTTPD is fast, simple and very small. It supports HTTP GET and POST method (that's all you need for more than 90% of time). It also supports HTTP Basic Authentication. Authentication can be performed by name and password lookup in a text file (userid:Unix_crypted_password) or from A LDAP server directly. And the server can be compiled as a secure server (SSL). The server does not have any configuration file and will not have any. Everything needed is hard coded at the top of the single C file."

# 1017 ShodanHQ results for "Server: mhttpd v"
# 472 ShodanHQ results for "Meta-HTML-Engine"
examples %w|
62.141.28.184
80.187.232.56
85.26.136.53
89.200.94.124
91.80.4.173
91.80.25.135
94.234.172.107
160.218.191.221
212.93.101.98
207.54.126.212
216.127.97.198
216.127.99.157
216.127.97.229
216.127.100.103
216.162.224.49
216.162.226.85
216.162.226.107
216.162.226.109
216.162.226.161
|

# HTTP Header
def passive
	m=[]

	# Server # Short
	if @meta["server"] =~ /[\s]*mhttpd v([\d\.]+)/i
		m << { :version=>@meta["server"].to_s.scan(/[\s]*mhttpd v([\d\.]+)/i) }
	end

	# Server # Long
	if @meta["server"] =~ /[\s]*MHttpd\/([\d\.]+) \([^;]+; [^;]+; Meta-HTML\/[\d\.]+\)/
		m << { :version=>@meta["server"].to_s.scan(/[\s]*MHttpd\/([\d\.]+) \([^\;]+; [^\;]+; Meta-HTML\/[\d\.]+\)/), :module=>@meta["server"].to_s.scan(/[\s]*MHttpd\/[\d\.]+ \([^\;]+; ([^\;]+); Meta-HTML\/[\d\.]+\)/) }
	end

	# Meta-HTML-Engine
	if @meta["meta-html-engine"] =~ /[\s]*MHttpd\/([\d\.]+) \([^;]+; [^;]+; Meta-HTML\/[\d\.]+\)/
		m << { :version=>@meta["meta-html-engine"].to_s.scan(/[\s]*MHttpd\/([\d\.]+) \([^\;]+; [^\;]+; Meta-HTML\/[\d\.]+\)/), :module=>@meta["meta-html-engine"].to_s.scan(/[\s]*MHttpd\/[\d\.]+ \([^\;]+; ([^\;]+); Meta-HTML\/[\d\.]+\)/) }
	end

	m

end

end

