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

# Examples #
examples %w|
99.159.90.225
62.150.85.135
64.83.249.99
173.11.183.10
71.187.166.166
68.20.225.52
79.39.238.146
82.90.49.177
173.23.144.191
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^webfs\/([^\s]+)$/) } if @meta["server"] =~ /^webfs\/([^\s]+)$/

	# Return passive matches
	m
end

end

