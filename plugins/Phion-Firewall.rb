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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Phion\/(.+)$/) } if @headers["server"] =~ /^Phion\/(.+)$/

	# Return passive matches
	m

end

end

