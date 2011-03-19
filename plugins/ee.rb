##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "?" do
author "Brendan Coles"
description "In celebration of our 500th plugin - 2010-10-18"
version "1.0"















def passive
	m=[]
	m << { :version=>"When you look into an abyss, the abyss also looks into you."} if @base_uri.to_s =~ /^http:\/\/(www\.)?morningstarsecurity.com\/research\/whatweb/i
	m
end
end

