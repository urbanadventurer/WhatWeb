##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Phion-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Phion Firewall is now Barracuda NG Firewall - Homepage: http://www.phion.com/INT/products/perimeter_security/Pages/default.aspx"

# ShodanHQ results as at 2011-03-13 #
# 1,011 for Phion -apache -IIS
# Most results are from Austria

# Examples #
examples %w|
213.33.118.92
62.225.42.139
194.49.73.194
209.82.53.156
62.157.109.201
217.7.144.180
217.6.209.228
195.145.199.14
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Phion\/(.+)$/) } if @meta["server"] =~ /^Phion\/(.+)$/

	# Return passive matches
	m

end

end

