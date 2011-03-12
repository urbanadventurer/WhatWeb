##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BlackJumboDog" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "SapporoWorks BlackJumboDog provides server functions (HTTP, FTP, etc) - Homepage: http://www.spw02.sakura.ne.jp/spw/"

# ShodanHQ results as at 2011-03-13 #
# 453 for BlackJumboDog
# Most results are from Japan

# Examples #
examples %w|
123.217.220.3
60.239.147.248
211.131.133.170
211.3.242.206
120.51.223.55
121.84.187.58
122.249.175.207
114.190.26.11
118.243.116.139
211.5.220.118
118.157.243.170
124.96.62.30
61.194.10.34
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^BlackJumboDog$/

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^BlackJumboDog Version (.+)$/) } if @meta["server"] =~ /^BlackJumboDog Version (.+)$/

	# Return passive matches
	m

end

end

