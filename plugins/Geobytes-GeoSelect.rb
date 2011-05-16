##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Geobytes-GeoSelect" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.1"
description "GeoSelect gives you easy access to numerous features that you can use to impress your clients.  From geographically customized menus through to log file analysis, your clients will be impressed when they see their web site dynamically transformed to the viewer's location. - Homepage: http://www.geobytes.com/GeoSelect.htm"

# ShodanHQ results as at 2011-05-17 #
# 76 for geobytes

# Examples #
examples %w|
www.geobytes.com
64.60.28.195
209.98.72.247
69.59.27.233
89.140.107.7
69.59.27.232
209.98.212.113
69.64.72.32
38.96.155.187
67.228.197.232
24.248.38.161
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/Geobytes-GeoSelect\/([\d\.]+)/) } if @meta["server"] =~ /Geobytes-GeoSelect\/([\d\.]+)/

	# Return passive matches
	m
end

end

