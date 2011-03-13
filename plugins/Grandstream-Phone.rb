##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Grandstream-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Grandstream Networks is the leading manufacturer of IP voice/video telephony and video surveillance solutions. - Homepage: http://www.grandstream.com/"

# ShodanHQ results as at 2011-03-14 #
# 25,344 for Grandstream

# Examples #
examples %w|
200.152.68.238
216.54.149.49
84.28.128.218
62.165.255.156
213.91.127.84
76.24.77.183
99.238.119.2
190.9.211.236
78.32.89.204
77.244.135.94
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Grandstream/

		# Model Detection
		m << { :model=>@meta["server"].scan(/^Grandstream ([^\s]+) [\d\.]+$/) } if @meta["server"] =~ /^Grandstream ([^\s]+) [\d\.]+$/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^Grandstream [^\s]+ ([\d\.]+)$/) } if @meta["server"] =~ /^Grandstream [^\s]+ ([\d\.]+)$/

		m << { :version=>@meta["server"].scan(/^Grandstream\/([\d\.]+)$/) } if @meta["server"] =~ /^Grandstream\/([\d\.]+)$/

	end

	# Return passive matches
	m
end

end

