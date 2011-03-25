##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zeus-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "Zeus Web Server is the most scalable, high-performance web server software available, underpinning business-critical solutions for the world's leading web hosting, content provider and secure e-commerce companies. - Homepage: http://www.zeus.com/products/web-server/"

# ShodanHQ results as at 2011-03-25 #
# 7,251 for zeus
#    38 for X-Zeus-Mapping

# Examples #
examples %w|
116.197.174.211
174.133.7.205
203.97.34.152
205.207.122.17
84.22.162.68
69.20.229.179
64.38.217.64
64.235.41.62
64.235.45.102
69.20.229.232
203.97.34.152
222.231.10.26
195.186.145.37
203.97.36.62
203.97.35.128
203.97.34.89
203.97.34.185
203.97.36.10
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^Zeus$/

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Zeus\/([\d]+)(.|_)([\d]+)$/).to_s } if @meta["server"] =~ /^Zeus\/([\d]+)(.|_)([\d]+)$/

	# Return passive matches
	m

end

end

