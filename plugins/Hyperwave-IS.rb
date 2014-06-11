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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Hyperwave-IS\/([^\s]+)$/) } if @headers["server"] =~ /^Hyperwave-IS\/([^\s]+)$/
	m << { :version=>@headers["server"].scan(/^Hyperwave-Information-Server\/([^\s]+)$/) } if @headers["server"] =~ /^Hyperwave-Information-Server\/([^\s]+)$/

	# Return passive matches
	m
end

end

