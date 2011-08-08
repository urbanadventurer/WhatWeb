##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Billion-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "Billion router - Homepage: http://www.billion.com/product/product.html"

# ShodanHQ results as at 2011-08-05 #
# 1,340 for Billion Sky

# Examples #
examples %w|
|

# Passive #
def passive
	m=[]

	# WWW-Authenticate: Basic realm="Billion Sky" 
	if @headers["www-authenticate"] =~ /Basic realm="Billion Sky"/
		m << { :name=>"WWW-Authenticate" }
	end

	# Return passive matches
	m
end
end

