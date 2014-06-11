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


# HTTP Header
def passive
	m=[]

	# Version Detection # Server DAV
	m << { :version=>@headers["server"].scan(/[^\r^\n]*DAV\/([^\s^\r^\n]*)/) } if @headers["server"] =~ /[^\r^\n]*DAV\/([^\s^\r^\n]*)/

	# MS-Author-Via
	if @headers["MS-Author-Via"].to_s =~ /^[\s]*DAV/ or @headers["ms-author-via"].to_s =~ /^[\s]*DAV/
		m << { :name=>"MS-Author-Via HTTP Header" }
	end

	# DAV
	m << { :version=>@headers["dav"].scan(/[\s]*1,2,<http:\/\/([^>]+)>/) } unless @headers["dav"].nil?

	# X-WebDAV-Status
	m << { :name=>"x-webdav-status HTTP Header" } unless @headers["x-webdav-status"].nil?

	m

end

end

