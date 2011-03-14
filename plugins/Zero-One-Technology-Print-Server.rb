##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zero-One-Technology-Print-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Zero One Technology Print Server - Print servers connect printers directly to the network so that multiple PCs can share them. - Homepage: http://www.01tech.com/p1-1product.asp?Bid=2"

# ShodanHQ results as at 2011-03-14 #
# 2,579 for ZOT-PS

# Examples #
examples %w|
91.44.72.55
140.109.113.11
148.247.185.99
140.118.32.50
163.15.156.117
132.216.67.41
203.68.181.97
140.116.205.102
118.82.7.157
189.136.157.58
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^ZOT-PS-[\d]+\/(.+)$/) } if @meta["server"] =~ /^ZOT-PS-[\d]+\/(.+)$/

	# Return passive matches
	m

end

end

