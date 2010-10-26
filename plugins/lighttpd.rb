##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "lighttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "lighttpd - fly light - Lightweight open-source web server. - homepage: http://www.lighttpd.net/"

# About 124972 ShodanHQ results for "server: lighttpd" @ 2010-10-26
examples %w|
64.120.143.228
95.86.66.249
88.148.20.117
71.191.249.57
96.31.161.122
76.84.0.61
76.84.0.61
84.189.220.8
59.10.185.186
208.94.198.165
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*lighttpd\/([^\s^\r^\n]+)/).to_s } if @meta["server"].to_s =~ /^[\s]*lighttpd\/([^\s^\r^\n]+)/
	m << { :version=>@meta["Server"].to_s.scan(/^[\s]*lighttpd\/([^\s^\r^\n]+)/).to_s } if @meta["Server"].to_s =~ /^[\s]*lighttpd\/([^\s^\r^\n]+)/

	m

end

end

