##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "FileMakerPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "FileMaker Pro web publishing - FileMaker Pro is powerful, easy-to-use database software that helps you and your team get any task done faster. Millions of people in business, government, and education use FileMaker Pro to effortlessly manage all their information on Windows, Mac, and the web. - Homepage: http://www.filemaker.com.au/products/filemaker-pro/"

# ShodanHQ results as at 2011-03-13 #
# 951 for FileMakerPro
# 127 for FileMakerPro -WebCompanion

# Examples #
examples %w|
67.95.148.193
84.53.124.145
67.95.148.236
67.95.148.241
67.95.148.226
72.43.106.214
82.171.186.106
189.129.58.118
96.57.241.26
150.146.2.34
71.254.168.9
61.115.79.64
131.172.8.230
76.102.176.186
208.71.57.32
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^FileMakerPro\/([^\s]+)/

		# Version Detection # HTTP Server Header
		m << { :version=>@meta["server"].scan(/^FileMakerPro\/([^\s]+)/) }
		# Module Detection # HTTP Server Header
		m << { :module=>@meta["server"].scan(/^FileMakerPro\/[^\s]+ (WebCompanion\/.+)$/) } if @meta["server"] =~ /^FileMakerPro\/[^\s]+ (WebCompanion\/.+)$/
	end

	# Return passive matches
	m

end

end

