##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zeus-Traffic-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-17
version "0.1"
description "Zeus Traffic Manager - Application Delivery Controller - allows you to deliver fast, secure and available applications to your users at minimum infrastructure cost across any combination of physical, virtual and cloud infrastructures. - Homepage: http://www.zeus.com/products/traffic-manager/index.html"

# ShodanHQ results as at 2011-03-17 #
# 8,788 for set-cookie X-Mapping

# Examples #
examples %w|
209.163.246.98
88.208.249.35
98.129.200.228
174.143.69.60
98.129.229.146
209.163.249.106
174.143.191.19
98.129.246.7
64.39.22.96
|

# Passive #
def passive
	m=[]

	# Set-Cookie # X-Mapping
	m << { :name=>"Set-Cookie" } if @meta["set-cookie"] =~ /^X-Mapping-[a-z]{8}=([A-F\d]{32}|deleted);/

	# Return passive matches
	m

end

end

