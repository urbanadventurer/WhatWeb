##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Footprint" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-31
version "0.1"
description "Caching server"

# ShodanHQ results as at 2011-03-31 #
# 11,711 for Footprint FPMCP



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Footprint ([\d\.]+)\/FPMCP$/) } if @headers["server"] =~ /^Footprint ([\d\.]+)\/FPMCP$/

	# Return passive matches
	m

end

end

