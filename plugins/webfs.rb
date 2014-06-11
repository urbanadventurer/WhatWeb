##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "webfs" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "This is a simple http server for mostly static content.  You can use it to serve the content of a ftp server via http for example. - Homepage: http://linux.bytesex.org/misc/webfs.html"

# ShodanHQ results as at 2011-05-31 #
# 4,713 for webfs



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^webfs\/([^\s]+)$/) } if @headers["server"] =~ /^webfs\/([^\s]+)$/

	# Return passive matches
	m
end

end

