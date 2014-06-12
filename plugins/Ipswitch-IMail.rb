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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Ipswitch-IMail\/([\d\.]+)$/) } if @headers["server"] =~ /^Ipswitch-IMail\/([\d\.]+)$/

	# Return passive matches
	m

end

end

