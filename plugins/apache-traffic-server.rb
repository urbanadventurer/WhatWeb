##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Traffic-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Apache Traffic Server is a fast, scalable and extensible HTTP/1.1 compliant caching proxy server."
website "http://trafficserver.apache.org/"

# ShodanHQ results as at 2011-08-05 #
# 169 for ApacheTrafficServer



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

