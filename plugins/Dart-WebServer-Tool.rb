##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dart-WebServer-Tool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Build web applications in any familiar software development environment. Use WebServer for ActiveX to add web-based access to traditional compiled applications - Homepage: http://www.dart.com/ptwbs.aspx"

# ShodanHQ results as at 2011-03-14 #
# 470 for Dart WebServer Tool

# Examples #
examples %w|
support.dart.com
90.2.56.220
62.180.76.105
193.251.33.17
138.108.19.16
208.207.2.178
207.135.187.124
68.177.52.118
75.61.87.28
69.56.167.184
69.56.167.183
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Dart WebServer Tool\/([\d\.]+)$/) } if @meta["server"] =~ /^Dart WebServer Tool\/([\d\.]+)$/

	# Return passive matches
	m

end

end

