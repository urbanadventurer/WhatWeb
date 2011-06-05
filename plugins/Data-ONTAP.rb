##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Data-ONTAP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-05
version "0.1"
description "Data ONTAP - fully virtualized data management environment. Data ONTAP provides a virtualized data environment with a simple interface that enables you to create virtual storage volumes, make changes quickly, and achieve superior storage utilization. - Homepage: http://www.netapp.com/us/products/platform-os/data-ontap/"

# ShodanHQ results as at 2011-06-05 #
# 110 for Data ONTAP

# Examples #
examples %w|
194.27.180.151
131.216.9.94
138.100.243.161
128.163.2.53
163.25.104.58
138.100.8.61
129.8.15.171
152.2.235.28
129.8.15.167
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Data ONTAP\/\/?([^\s]+)$/) } if @meta["server"] =~ /^Data ONTAP\/\/?([^\s]+)$/

	# Return passive matches
	m
end

end

