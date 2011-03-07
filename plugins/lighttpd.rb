##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-06 #
# Updated OS detection
##
# Version 0.2 # 2011-01-25 #
# Updated version detection
##
Plugin.define "lighttpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.3"
description "Lightweight open-source web server - Homepage: http://www.lighttpd.net/"

# ShodanHQ results as at 2010-10-26 #
# 124,972 for "server: lighttpd"

# Examples #
examples %w|
64.120.143.228
68.153.46.136
88.148.20.117
71.191.249.57
96.31.161.122
208.94.198.165
|

# Passive #
def passive
	m=[]

	# Version Detection # Server HTTP header
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*lighttpd\/([^\s^\r^\n]+)/).to_s } if @meta["server"].to_s =~ /^[\s]*lighttpd\/([^\s^\r^\n]+)/

	# OS Detection # Server HTTP header
	m << { :os=>@meta["server"].scan(/^[\s]*lighttpd \(([^\)]+)\)/).to_s } if @meta["server"] =~ /^[\s]*lighttpd \(([^\)]+)\)/

	# Return passive results
	m

end

end

