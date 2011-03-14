##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetBox" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "NetBox HTTP server [Chinese] - Homepage: http://www.netbox.cn/"

# ShodanHQ results as at 2011-03-14 #
# 1,778 for NetBox -realm

# Examples #
examples %w|
217.79.237.219
202.195.195.147
61.164.59.82
218.75.53.94
58.246.90.206
221.214.7.194
119.55.242.227
118.102.27.190
118.102.27.201
118.102.27.162
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^NetBox Version (.+)$/) } if @meta["server"] =~ /^NetBox Version (.+)$/

	# Return passive matches
	m

end

end

