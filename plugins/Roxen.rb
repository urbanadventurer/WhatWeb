##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Roxen" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "Roxen WebServer is a full-featured open-source web server distributed under the GPL license. - Homepage: http://www.roxen.com/products/webserver/"

# ShodanHQ results as at 2011-04-17 #
# 1,051 for Roxen

# Examples #
examples %w|
princeton.edu
145.92.233.201
60.234.1.6
178.237.32.243
202.234.167.54
212.247.28.196
145.92.233.211
90.225.64.52
90.145.59.235
128.112.133.48
178.237.32.227
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers['server'] =~ /^Roxen/

		m << { :name=>"HTTP Server Header" } if @headers['server'] =~ /^Roxen$/

		# Version Detection # HTTP Server Header
		m << { :version=>@headers["server"].scan(/^Roxen\/([^\s]+)$/) } if @headers["server"] =~ /^Roxen\/([^\s]+)$/

	end

	# Return passive matches
	m
end

end

