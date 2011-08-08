##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "fnord" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "fnord - yet another small httpd - Homepage: http://www.fefe.de/fnord/"

# ShodanHQ results as at 2011-05-31 #
# 6,444 for fnord

# Examples #
examples %w|
72.24.68.214
84.253.184.218
165.228.186.222
58.6.122.236
87.55.241.14
117.53.131.145
67.79.50.70
41.225.238.178
217.193.155.10
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^fnord\/([^\s]+)$/) } if @headers["server"] =~ /^fnord\/([^\s]+)$/

	# Return passive matches
	m
end

end

