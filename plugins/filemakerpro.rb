##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-20 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "FileMakerPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "FileMaker Pro web publishing - FileMaker Pro is powerful, easy-to-use database software that helps you and your team get any task done faster. Millions of people in business, government, and education use FileMaker Pro to effortlessly manage all their information on Windows, Mac, and the web."
website "http://www.filemaker.com.au/products/filemaker-pro/"

# ShodanHQ results as at 2011-03-13 #
# 951 for FileMakerPro
# 127 for FileMakerPro -WebCompanion

matches [

	# HTTP Server Header
	{ :regexp=>/^FileMakerPro/, :search=>"headers[server]" },
	# Version Detection # HTTP Server Header
	{ :version=>/^FileMakerPro\/([^\s]+)/, :search=>"headers[server]" },
	# Module Detection # HTTP Server Header
	{ :module=>/^FileMakerPro\/[^\s]+ (WebCompanion\/.+)$/, :search=>"headers[server]" },

]

end

