##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added Server DAV/[\d\.]+ version detection
##
Plugin.define "WebDAV" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.2"
description "Web-based Distributed Authoring and Versioning (WebDAV) is a set of methods based on the Hypertext Transfer Protocol (HTTP) that facilitates collaboration between users in editing and managing documents and files stored on World Wide Web servers. - More Info: http://en.wikipedia.org/wiki/WebDAV"

# 22354 ShodanHQ results for MS-Author-Via: DAV
# 323 ShodanHQ results for webdav
# 110 ShodanHQ results for "DAV: 1,2,<http"
examples %w|
24.229.202.79
41.200.250.19
66.37.58.180
67.219.60.190
62.154.206.93
70.154.131.249
81.25.190.151
83.241.144.122
94.193.169.160
95.240.44.146
141.84.66.71
162.127.16.24
168.176.27.169
174.54.240.30
174.143.27.191
173.11.171.172
173.74.74.208
217.144.100.163
212.87.83.78
|

# HTTP Header
def passive
	m=[]

	# Version Detection # Server DAV
	m << { :version=>@meta["server"].scan(/[^\r^\n]*DAV\/([^\s^\r^\n]*)/) } if @meta["server"] =~ /[^\r^\n]*DAV\/([^\s^\r^\n]*)/

	# MS-Author-Via
	if @meta["MS-Author-Via"].to_s =~ /^[\s]*DAV/ or @meta["ms-author-via"].to_s =~ /^[\s]*DAV/
		m << { :name=>"MS-Author-Via HTTP Header" }
	end

	# DAV
	m << { :version=>@meta["dav"].scan(/[\s]*1,2,<http:\/\/([^>]+)>/) } unless @meta["dav"].nil?

	# X-WebDAV-Status
	m << { :name=>"x-webdav-status HTTP Header" } unless @meta["x-webdav-status"].nil?

	m

end

end

