##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Replaced passive function with matches
##
Plugin.define "BlueDragon" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-30
version "0.2"
description "BlueDragon for the Microsoft .NET Framework allows you to natively integrate and deploy your ColdFusion applications on the .NET platform."
website "http://www.newatlanta.com/products/bluedragon/product_info/overview.cfm"

# ShodanHQ results as at 2011-07-30 #
# 319 for BlueDragon

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/BlueDragon Server (JXAS|JX)/, :search=>"headers[server]" },
	
	# Version Detection # x-powered-by header
	{ :version=>/BlueDragon Server\/([^\s^,]+)/, :search=>"headers[x-powered-by]" },

	# Version Detection # HTTP Server Header
	{ :version=>/BlueDragon Server( JXAS| JX)?(\/| )([\d\.]+)/, :offset=>2, :search=>"headers[server]" },
	
]

end

