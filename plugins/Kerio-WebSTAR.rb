##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kerio-WebSTAR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Kerio WebSTAR (formerly 4D WebSTAR and StarNine WebSTAR) is an HTTP web server for Mac OS X with older versions running on classic Mac OS. On June 30, 2008, WebSTAR was officially discontinued. Technical support for the product ended on June 30, 2009. - More info: en.wikipedia.org/wiki/Kerio_WebSTAR"

# ShodanHQ results as at 2011-05-31 #
# 5,486 for WebSTAR
# 3,267 for WebSTAR -4d

# Examples #
examples %w|
221.250.175.149
192.166.192.11
65.211.11.40
67.102.134.82
157.6.54.8
65.211.11.97
212.9.185.150
68.15.228.128
216.145.68.187
70.88.70.221
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^(Kerio_)?WebSTAR/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^WebSTAR\/([^\s^\(]+)/) } if @meta["server"] =~ /^WebSTAR\/([^\s^\(]+)/
		m << { :version=>@meta["server"].scan(/^Kerio_WebSTAR\/([^\s^\(]+)/) } if @meta["server"] =~ /^Kerio_WebSTAR\/([^\s^\(]+)/
		m << { :version=>@meta["server"].scan(/^WebSTAR ([\d\.]+ .+)$/) } if @meta["server"] =~ /^WebSTAR ([\d\.]+ .+)$/

	end

	# HTTP Server Header
	if @meta["server"] =~ /^4D_WebStar_[A-Z]\//

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^4D_WebStar_[A-Z]\/([\d\.]+)/) } if @meta["server"] =~ /^4D_WebStar_[A-Z]\/([\d\.]+)/

	end

	# Return passive matches
	m
end

end

