##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SuperSalon-POS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-22
version "0.1"
description "SuperSalon is one of the newest salon software systems in the market, but has already been licensed in thousands of national chain, regional chain and independent salons and cosmetology schools in the US, Canada, Europe and Asia, making it one of the most widely licensed salon POS software in the world. - Homepage: http://www.supersalon.com/"

# ShodanHQ results as at 2011-06-22 #
# 403 for "SuperSalon POS"

# Examples #
examples %w|
70.24.92.23
76.236.75.189
208.107.212.163
68.191.186.180
70.130.157.79
|

# Passive #
def passive
	m=[]

	# WWW-Authenticate realm
	m << { :name=>"WWW-Authenticate realm" } if @meta["www-authenticate"] =~ /^Basic realm="SuperSalon POS"$/

	# Return passive matches
	m
end

end

