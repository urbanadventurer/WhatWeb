##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Russian-Apache" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-04
version "0.1"
description "Russian Apache is based on the popular HTTP server Apache, with additional functionality required for simultaneous support of several cyrillic encodings. Some changes were introduced into the Apache source code as this functionality cannot be ensured by a fully independent module. - Homepage: http://apache.lexa.ru/english/"

# ShodanHQ results as at 2011-08-04 #
# 10,842 for rus/PL

# Examples #
examples %w|
62.213.112.3
217.23.157.92
62.213.74.107
62.213.112.60
62.213.112.245
62.213.81.254
217.23.158.205
89.108.105.56
62.213.113.7
79.137.231.15
77.236.43.47
|

trigger "rus"

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ / rus\/(PL[^\s]+)/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

