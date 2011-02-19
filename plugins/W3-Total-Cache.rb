##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "W3-Total-Cache" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-19
version "0.1"
description "The fastest and most complete WordPress performance optimization plugin. Trusted by many popular blogs - W3 Total Cache improves the user experience of your blog by improving your server performance, caching every aspect of your site, reducing the download time of your theme and providing transparent content delivery network (CDN) integration. - Homepage: http://www.w3-edge.com/wordpress-plugins/w3-total-cache/"

# ShodanHQ results as at 2011-02-19 #
# 3,086 for W3 Total Cache

# Examples #
examples %w|
dragonblogger.com
sexyschoolgirloutfit.org
74.63.91.122
66.172.26.233
173.201.231.186
96.30.11.28
173.83.144.158
64.224.108.76
69.167.135.146
188.165.182.148
173.192.235.134
|

# Matches #
matches [

# Default HTML Comment
{ :text=>'<!-- Performance optimized by W3 Total Cache. Learn more: http://www.w3-edge.com/wordpress-plugins/' },

]

# Passive #
def passive
	m=[]

	# Version detection # X-Powered-By
	m << { :version=>@meta['x-powered-by'].scan(/W3 Total Cache\/([\d\.]+)/) } if @meta['x-powered-by'] =~ /W3 Total Cache\/([\d\.]+)/

	# Return passive matches
	m

end

end


