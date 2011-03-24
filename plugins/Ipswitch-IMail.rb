##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ipswitch-IMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "IMail Server matches the capabilities of Exchange without the maintenance headache or hefty price tag. From install assistance to unlimited tech support, IMail delivers your complete messaging solution. - Homepage: http://www.imailserver.com/"

# ShodanHQ results as at 2011-03-24 #
# 5,802 for Ipswitch-IMail

# Examples #
examples %w|
69.61.126.107
98.143.118.3
208.179.154.150
208.179.154.177
210.157.236.132
206.82.158.25
64.247.175.5
217.118.202.192
61.154.164.68
216.41.232.79
202.108.221.15
67.100.108.115
63.246.16.41
64.206.239.244
219.118.71.70
64.206.239.224
219.118.71.65
203.130.251.163
194.251.35.153
208.52.16.23
170.210.46.39
202.215.53.85
217.64.56.3
200.59.153.83
64.94.134.95
208.31.107.137
64.94.134.119
200.59.153.22
208.31.107.65
203.170.201.14
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Ipswitch-IMail\/([\d\.]+)$/) } if @meta["server"] =~ /^Ipswitch-IMail\/([\d\.]+)$/

	# Return passive matches
	m

end

end

