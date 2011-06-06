##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Hyperwave-IS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "Hyperwave Information Server - Homepage: http://www.hyperwave.com/"

# ShodanHQ results as at 2011-06-07 #
# 46 for hyperwave

# Examples #
examples %w|
141.89.48.55
62.134.187.16
141.75.28.127
89.199.255.93
195.244.251.9
81.223.81.183
196.38.120.19
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Hyperwave-IS\/([^\s]+)$/) } if @meta["server"] =~ /^Hyperwave-IS\/([^\s]+)$/
	m << { :version=>@meta["server"].scan(/^Hyperwave-Information-Server\/([^\s]+)$/) } if @meta["server"] =~ /^Hyperwave-Information-Server\/([^\s]+)$/

	# Return passive matches
	m
end

end

