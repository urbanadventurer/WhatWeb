##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-UA-Compatible" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-08
version "0.1"
description "This plugin retrieves the X-UA-Compatible value from the HTTP header and meta http-equiv tag. - More Info: http://msdn.microsoft.com/en-us/library/cc817574.aspx"

# About 30930 ShodanHQ results for X-UA-Compatible @ 2011-01-08



# Matches #
matches [

	# meta http-equiv tag
	{ :string=>/<meta http-equiv[\s]*=[^>]*X-UA-Compatible[^>]*[\s]+content[\s]*=[\s]*['|"]?([a-z0-9=]+)[^>]*>/i },

]

# Passive #
def passive
	m=[]

	# X-UA-Compatible HTTP Header
	m << { :string=>@headers["x-ua-compatible"].to_s } unless @headers["x-ua-compatible"].nil?

	m

end

end

