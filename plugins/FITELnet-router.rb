##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FITELnet-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "FITELnet router - Homepage: http://www.furukawa.co.jp/fitelnet/"

# ShodanHQ results as at 2011-03-30 #
# 4,374 for GR-HTTPD Server
# Most results are from Japan

# Examples #
examples %w|
211.120.70.74
125.172.241.95
124.25.205.65
122.249.127.238
122.249.127.4
74.92.240.215
210.167.121.212
74.92.240.212
148.71.54.164
210.167.120.114
74.92.240.213
148.71.54.164
125.172.241.95
124.25.205.65
118.21.140.31
123.217.161.49
61.213.138.194
221.186.180.161
125.207.6.75
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^GR-HTTPD Server\/([\d\.]+)$/

		m << { :certainty=>75, :name=>"HTTP Server Header" }

		# Model Detection # Title
		m << { :model=>@body.scan(/<TITLE> FITELnet-([A-Z][\d]+) [^>]+<\/TITLE>$/) } if @body =~ /<TITLE> FITELnet-([A-Z][\d]+) [^>]+<\/TITLE>$/

		# MAC Detection
		m << { :string=>@body.scan(/<TITLE> FITELnet-[A-Z][\d]+ [^>]+\(([\da-f:]{17})\)<\/TITLE>$/) } if @body =~ /<TITLE> FITELnet-[A-Z][\d]+ [^>]+\(([\da-f:]{17})\)<\/TITLE>$/

	end

	# Return passive matches
	m

end

end

