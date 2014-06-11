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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Dart WebServer Tool\/([\d\.]+)$/) } if @headers["server"] =~ /^Dart WebServer Tool\/([\d\.]+)$/

	# Return passive matches
	m

end

end

