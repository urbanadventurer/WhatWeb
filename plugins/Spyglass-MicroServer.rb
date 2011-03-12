##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Spyglass-MicroServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Spyglass MicroServer is a small footprint, scalable, embedded Web server that is standards-based, customizable and features dynamic content generation with multi-platform support."

# ShodanHQ results as at 2011-03-13 #
# 441 for Spyglass MicroServer

# Examples #
examples %w|
64.131.31.50
138.23.172.26
131.246.60.9
128.112.45.60
64.131.31.56
150.59.188.130
130.83.208.96
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Spyglass_MicroServer\/(.+)$/) } if @meta["server"] =~ /^Spyglass_MicroServer\/(.+)$/

	# Return passive matches
	m

end

end

