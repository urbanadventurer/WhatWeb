##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cougar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Cougar video conferencing server - Homepage: http://www.cougarconference.com/"

# ShodanHQ results as at 2011-07-27 #
# 21,987 for Cougar
# 21,026 for Cougar Supported



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Cougar\/([\d\.]+)$/) } if @headers["server"] =~ /^Cougar\/([\d\.]+)$/

	# Return passive matches
	m
end
end

