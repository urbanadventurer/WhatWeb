##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Traffic-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Apache Traffic Server is a fast, scalable and extensible HTTP/1.1 compliant caching proxy server. - Homepage: http://trafficserver.apache.org/"

# ShodanHQ results as at 2011-08-05 #
# 169 for ApacheTrafficServer

# Examples #
examples %w|
90.223.204.79
90.223.198.68
90.223.204.177
90.223.204.182
67.201.31.4
90.223.198.26
90.223.198.72
90.223.198.57
90.223.204.184
90.223.204.119
110.45.220.89
71.6.217.25
123.30.184.107
66.225.209.147
115.68.20.74
88.217.226.143
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^ATS\/([^\s]+)$/
		m << { :version=>"#{$1}" }
	end

	# Version Detection # HTTP Via Header
	if @headers["via"] =~ /^(http|HTTP)\/1\.1 ([^\s]+) \(ApacheTrafficServer\/([^\s]+) \[c s f \]\)$/
		m << { :string =>"#{$2}" }
		m << { :version=>"#{$3}" }
	end

	# Return passive matches
	m
end
end

