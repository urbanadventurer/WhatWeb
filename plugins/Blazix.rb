##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Blazix" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-06
version "0.1"
description "Blazix is a high-performance full-featured Java application server. Blazix can be used as an Application Server or as a full Web Server. - Homepage: http://www.blazix.com/"

# ShodanHQ results as at 2011-06-06 #
# 14 for Blazix



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Blazix Java Server ([^\s]+)$/) } if @headers["server"] =~ /^Blazix Java Server ([^\s]+)$/

	# Return passive matches
	m
end

end

