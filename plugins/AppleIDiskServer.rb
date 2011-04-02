##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AppleIDiskServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.1"
description "With MobileMe iDisk, it.s easy to store, access, and share files online. You have plenty of storage space . even large files are no problem. Just add the files you need to your iDisk, and whatever you upload will be there for you to download using a web browser on any computer or using the iDisk app for iPhone, iPad, or iPod touch. - Homepage: http://www.apple.com/mobileme/features/idisk.html"

# ShodanHQ results as at 2011-04-02 #
# 286 for AppleIDiskServer

# Examples #
examples %w|
2.18.76.59
184.84.12.59
69.192.92.59
207.245.91.218
184.50.252.59
2.18.108.59
184.29.172.59
184.86.140.59
2.19.44.59
96.16.116.59
17.250.248.124
17.250.249.70
17.250.249.130
17.250.249.139
17.250.249.91
17.250.249.133
17.250.249.150
17.250.249.78
17.250.248.147
17.250.248.155
|

# Passive #
def passive
	m=[]

	# HTTP Server header
	if @meta["server"] =~ /^AppleIDiskServer[\.|-][A-Z\d]+$/

		# Version Detection 
		m << { :string=>@meta["server"].scan(/^AppleIDiskServer[\.|-]([A-Z\d]+)$/) }

		# WWW Authenticate
		m << { :name=>"WWW Authenticate" } if @meta["www-authenticate"] =~ /Basic realm="me\.com"/

		# Account Detection # X-dmUser
		m << { :account=>@meta["x-dmuser"] } unless @meta["x-dmuser"].nil?
	end

	# Return passive matches
	m

end

end

