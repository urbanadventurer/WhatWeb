##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cherokee" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Cherokee is a very fast, flexible and easy to configure Web Server. It supports the widespread technologies nowadays: FastCGI, SCGI, PHP, CGI, uWSGI, SSI, TLS and SSL encrypted connections, Virtual hosts, Authentication, on the fly encoding, Load Balancing, Apache compatible log files, Data Base Balancing, Reverse HTTP Proxy, Traffic Shaper, Video Streaming and much more. - Homepage: http://www.cherokee-project.com/"

# ShodanHQ results as at 2011-05-30 #
# 3,196 for Cherokee



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Cherokee/

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		if @headers["server"] =~ /^Cherokee\/([^\s]+)/
			m << { :version=>@headers["server"].scan(/^Cherokee\/([^\s]+)/) }
		end
	end

	# Return passive matches
	m
end

end

