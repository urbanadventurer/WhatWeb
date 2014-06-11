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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/Geobytes-GeoSelect\/([\d\.]+)/) } if @headers["server"] =~ /Geobytes-GeoSelect\/([\d\.]+)/

	# Return passive matches
	m
end

end

