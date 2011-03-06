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

# Examples #
examples %w|
207.12.181.108
203.33.22.163
64.151.119.85
87.106.255.248
208.24.16.131
92.79.167.103
216.177.95.165
67.223.239.164
69.28.15.38
198.64.139.229
199.15.160.42
|

# Matches #
matches [

	# meta http-equiv tag
	{ :string=>/<meta http-equiv[\s]*=[^>]*X-UA-Compatible[^>]*[\s]+content[\s]*=[\s]*['|"]?([a-z0-9=]+)[^>]*>/i },

]

# Passive #
def passive
	m=[]

	# X-UA-Compatible HTTP Header
	m << { :string=>@meta["x-ua-compatible"].to_s } unless @meta["x-ua-compatible"].nil?

	m

end

end

