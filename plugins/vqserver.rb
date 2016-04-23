##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "vqServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "vqServer is multi-platform compatible. vqServer is a personal web server with support for password protection, file uploading, Java servlets and CGI scripts."

# ShodanHQ results as at 2011-08-07 #
# 7 for vqserver



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^vqServer\/([^\s]+) The world's most friendly web server$/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

