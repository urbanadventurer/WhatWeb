##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetPresenz" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "NetPresenz is a Classic Macintosh implementation of the WWW, Gopher and FTP server protocols. It is compatible with most web browsers and FTP clients. It allows your Mac to act as an FTP server so you (and others) can access your files from anywhere around the world. You can also host a web site directly from your computer. - Homepage: http://www.stairways.com/main/netpresenz"

# ShodanHQ results as at 2011-06-04 #
# 26 for netpresenz

# Examples #
examples %w|
129.22.129.203
206.205.130.131
155.207.5.59
74.124.163.192
81.224.46.177
194.204.19.10
64.198.81.221
150.46.110.44
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^NetPresenz/

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^NetPresenz\/([^\s]+)$/) } if @meta["server"] =~ /^NetPresenz\/([^\s]+)$/

	end

	# Return passive matches
	m
end

end

