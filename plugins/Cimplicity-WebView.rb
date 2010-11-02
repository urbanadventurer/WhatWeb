##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cimplicity-WebView" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "CIMPLICITY is a client/server based visualization and control solution that helps you visualize your operations, perform supervisory automation and deliver reliable information to higher-level analytic applications. - homepage: http://www.ge-ip.com/products/2819"

# 58 ShodanHQ results for CIMPLICITY-HttpSvr
examples %w|
24.148.112.118
68.178.61.99
83.13.87.230
95.51.250.138
79.188.201.155
66.15.197.75
84.199.78.194
80.55.14.190
220.227.249.238
|

matches [

# Default Title
{ :url=>"/index.html", :text=>"<TITLE>CIMPLICITY WebView</TITLE>" },

# Default Applet HTML
{ :text=>'<APPLET NAME="ProwlerClientAppletObject" ARCHIVE="/ProwlerClient.jar" '},

# Java Applet MD5 hash
{ :md5=>"be47085f5ac23b78c5b6a952ea0947b3", :url=>"/ProwlerClient.jar" },

]

# Passive #
def passive
	m=[]

	# Check HTTP Server
	if @meta["server"] =~ /^CIMPLICITY-HttpSvr\/([\d\.]+)/

		# Version Detection # HTTP Server Header
		m << { :version=>@meta["server"].scan(/^CIMPLICITY-HttpSvr\/([\d\.]+)/).to_s }

		# Extract Hostname # HTTP Location Header
		m << { :status=>302, :string=>"Hostname: "+@meta["location"].scan(/^http:\/\/([^\/]+)\/index.html$/).to_s } if @meta["location"] =~ /^http:\/\/([^\/]+)\/index.html$/

		# Extract screen path # /index.html
		m << { :string=>@body.scan(/<PARAM NAME="screen" VALUE="([^\"]+)">/).to_s } if @body =~ /<PARAM NAME="screen" VALUE="([^\"]+)">/

	end

	m

end

# Aggressive #
def aggressive
	m=[]

	# Check HTTP Server
	if @meta["server"] =~ /^CIMPLICITY-HttpSvr\/([\d\.]+)/

		target = URI.join(@base_uri.to_s,"/index.html").to_s
		status,url,ip,body,headers=open_target(target)

		# Extract screen path # /index.html
		m << { :string=>body.scan(/<PARAM NAME="screen" VALUE="([^\"]+)">/).to_s } if body =~ /<PARAM NAME="screen" VALUE="([^\"]+)">/

	end

	m

end

end

