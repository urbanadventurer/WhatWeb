##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved HTTP Server pattern from passive function to matches[]
##
Plugin.define "Cimplicity-WebView" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.2"
description "CIMPLICITY is a client/server based visualization and control solution that helps you visualize your operations, perform supervisory automation and deliver reliable information to higher-level analytic applications."
website "http://www.ge-ip.com/products/2819"

# ShodanHQ results as at 2010-11-02 #
# 58 for CIMPLICITY-HttpSvr

matches [

	# Default Title
	{ :url=>"/index.html", :text=>"<TITLE>CIMPLICITY WebView</TITLE>" },

	# Default Applet HTML
	{ :text=>'<APPLET NAME="ProwlerClientAppletObject" ARCHIVE="/ProwlerClient.jar" '},

	# Java Applet MD5 hash
	{ :md5=>"be47085f5ac23b78c5b6a952ea0947b3", :url=>"/ProwlerClient.jar" },

	# HTTP Server Header
	{ :regexp=>/^CIMPLICITY-HttpSvr/, :search=>"headers[server]"},

	# Version Detection # HTTP Server Header
	{ :version=>/^CIMPLICITY-HttpSvr\/([\d\.]+)/, :search=>"headers[server]"},

]

# Passive #
def passive
	m=[]

	# Check HTTP Server
	if @headers["server"] =~ /^CIMPLICITY-HttpSvr\/([\d\.]+)/

		# Extract Hostname # HTTP Location Header
		m << { :status=>302, :string=>"Hostname: "+@headers["location"].scan(/^http:\/\/([^\/]+)\/index.html$/).flatten.first.to_s } if @headers["location"] =~ /^http:\/\/([^\/]+)\/index.html$/

		# Extract screen path # /index.html
		m << { :string=>@body.scan(/<PARAM NAME="screen" VALUE="([^\"]+)">/).flatten } if @body =~ /<PARAM NAME="screen" VALUE="([^\"]+)">/

	end

	m

end

# Aggressive #
def aggressive
	m=[]

	# Check HTTP Server
	if @headers["server"] =~ /^CIMPLICITY-HttpSvr\/([\d\.]+)/

		target = URI.join(@base_uri.to_s,"/index.html").to_s
		status,url,ip,body,headers=open_target(target)

		# Extract screen path # /index.html
		m << { :string=>body.scan(/<PARAM NAME="screen" VALUE="([^\"]+)">/).flatten } if body =~ /<PARAM NAME="screen" VALUE="([^\"]+)">/

	end

	m

end

end

