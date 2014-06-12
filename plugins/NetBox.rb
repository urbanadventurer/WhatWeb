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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NetBox Version (.+)$/) } if @headers["server"] =~ /^NetBox Version (.+)$/

	# Return passive matches
	m

end

end

