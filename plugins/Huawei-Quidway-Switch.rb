##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Huawei-Quidway-Switch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Huawei network switch - Quidway series"
website "http://www.huawei.com/products/datacomm/catalog.do?id=16"

# ShodanHQ results as at 2011-08-07 #
# 103,440 for Lanswitch
# 103,166 for Lanswitch HttpServer



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Lanswitch - V([\d]{3})R([\d]{3}) HttpServer [\d\.]+$/
		m << { :version=>"#{$1}r#{$2}" }
	end

	# Return passive matches
	m
end
end

