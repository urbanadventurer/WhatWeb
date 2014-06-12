##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Velazquez" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-31
version "0.1"
description "Velazquez HTTP Server"

# ShodanHQ results as at 2011-03-13 #
# 293 for Velazquez



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Velazquez ([\d\.]+)$/) } if @headers["server"] =~ /^Velazquez ([\d\.]+)$/

	# Return passive matches
	m
end

end

