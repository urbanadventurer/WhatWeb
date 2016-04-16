##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Russian-Apache" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-04
version "0.1"
description "Russian Apache is based on the popular HTTP server Apache, with additional functionality required for simultaneous support of several cyrillic encodings. Some changes were introduced into the Apache source code as this functionality cannot be ensured by a fully independent module."
website "http://apache.lexa.ru/english/"

# ShodanHQ results as at 2011-08-04 #
# 10,842 for rus/PL



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

