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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^FileMakerPro\/([^\s]+)/

		# Version Detection # HTTP Server Header
		m << { :version=>@headers["server"].scan(/^FileMakerPro\/([^\s]+)/) }
		# Module Detection # HTTP Server Header
		m << { :module=>@headers["server"].scan(/^FileMakerPro\/[^\s]+ (WebCompanion\/.+)$/) } if @headers["server"] =~ /^FileMakerPro\/[^\s]+ (WebCompanion\/.+)$/
	end

	# Return passive matches
	m

end

end

