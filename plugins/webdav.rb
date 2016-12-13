##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.3 #
# Added Server DAV/[\d\.]+ version detection
##
Plugin.define "WebDAV" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.3"
description "Web-based Distributed Authoring and Versioning (WebDAV) is a set of methods based on the Hypertext Transfer Protocol (HTTP) that facilitates collaboration between users in editing and managing documents and files stored on World Wide Web servers. - More Info: http://en.wikipedia.org/wiki/WebDAV"

# 22354 ShodanHQ results for MS-Author-Via: DAV
# 323 ShodanHQ results for webdav
# 110 ShodanHQ results for "DAV: 1,2,<http"

matches [
	
	# Server DAV
	{ :regexp=>/[^\r^\n]*DAV\//, :search=>"headers[server]" },

	# Version Detection # Server DAV
	{ :version=>/[^\r^\n]*DAV\/([^\s^\r^\n]*)/, :search=>"headers[server]" },

	# MS-Author-Via
	{ :name=>"MS-Author-Via HTTP Header", :regexp=>/^[\s]*DAV/, :search=>"headers[MS-Author-Via]" },

	# DAV
	{ :version=>/[\s]*1,2,<http:\/\/([^>]+)>/, :search=>"headers[dav]" },

	# X-WebDAV-Status
	{ :name=>"x-webdav-status HTTP Header", :regexp=>//, :search=>"headers[x-webdav-status]" },

]

end

