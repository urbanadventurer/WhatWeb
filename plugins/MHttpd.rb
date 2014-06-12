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


# HTTP Header
def passive
	m=[]

	# Server # Short
	if @headers["server"] =~ /[\s]*mhttpd v([\d\.]+)/i
		m << { :version=>@headers["server"].to_s.scan(/[\s]*mhttpd v([\d\.]+)/i).flatten }
	end

	# Server # Long
	if @headers["server"] =~ /[\s]*MHttpd\/([\d\.]+) \([^;]+; [^;]+; Meta-HTML\/[\d\.]+\)/
		m << { :version=>@headers["server"].to_s.scan(/[\s]*MHttpd\/([\d\.]+) \([^\;]+; [^\;]+; Meta-HTML\/[\d\.]+\)/).flatten, :module=>@headers["server"].to_s.scan(/[\s]*MHttpd\/[\d\.]+ \([^\;]+; ([^\;]+); Meta-HTML\/[\d\.]+\)/).flatten }
	end

	# Meta-HTML-Engine
	if @headers["meta-html-engine"] =~ /[\s]*MHttpd\/([\d\.]+) \([^;]+; [^;]+; Meta-HTML\/[\d\.]+\)/
		m << { :version=>@headers["meta-html-engine"].to_s.scan(/[\s]*MHttpd\/([\d\.]+) \([^\;]+; [^\;]+; Meta-HTML\/[\d\.]+\)/).flatten, :module=>@headers["meta-html-engine"].to_s.scan(/[\s]*MHttpd\/[\d\.]+ \([^\;]+; ([^\;]+); Meta-HTML\/[\d\.]+\)/).flatten }
	end

	m

end

end

