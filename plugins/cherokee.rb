##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Cherokee"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-05-30
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
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

