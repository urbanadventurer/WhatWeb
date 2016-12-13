##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Dart-WebServer-Tool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "Build web applications in any familiar software development environment. Use WebServer for ActiveX to add web-based access to traditional compiled applications"
website "http://www.dart.com/ptwbs.aspx"

# ShodanHQ results as at 2011-03-14 #
# 470 for Dart WebServer Tool

matches [
	# Version Detection # HTTP Server Header
	{ :search=>"headers[server]", :version=>/^Dart WebServer Tool\/([\d\.]+)$/ },

]

end

