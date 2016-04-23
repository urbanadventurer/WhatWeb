##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "Cherokee" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.2"
description "Cherokee is a very fast, flexible and easy to configure Web Server. It supports the widespread technologies nowadays: FastCGI, SCGI, PHP, CGI, uWSGI, SSI, TLS and SSL encrypted connections, Virtual hosts, Authentication, on the fly encoding, Load Balancing, Apache compatible log files, Data Base Balancing, Reverse HTTP Proxy, Traffic Shaper, Video Streaming and much more."
website "http://www.cherokee-project.com/"

# ShodanHQ results as at 2011-05-30 #
# 3,196 for Cherokee

matches [

	# Version Detection
	{:name=>"HTTP Server Header", :version=>/^Cherokee\/([^\s]+)/, :search=>"headers[server]"},
	
	# HTTP Server Header
	{:name=>"HTTP Server Header", :regexp=>/^Cherokee/, :search=>"headers[server]"},

]

end

