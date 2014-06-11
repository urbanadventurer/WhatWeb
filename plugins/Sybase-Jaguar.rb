##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sybase-Jaguar" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-27
version "0.1"
description "Sybase Jaguar server - discontinued - Homepage: http://www.sybase.com/products/archivedproducts/jaguarcts"

# ShodanHQ results as at 2011-07-27 #
# 468 for Server: Jaguar Server Version



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Jaguar Server Version ([\d\.]+)$/) } if @headers["server"] =~ /^Jaguar Server Version ([\d\.]+)$/

	# Return passive matches
	m
end
end

