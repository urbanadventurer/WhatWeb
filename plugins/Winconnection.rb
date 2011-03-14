##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Winconnection" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "The Winconnection 6 is a gateway to access the Internet developed within the UTM (Unified Threat Management) philosophy. - Homepage: http://www.winco.com.br/"

# ShodanHQ results as at 2011-03-14 #
# 136 for Winconnection
# All results are from Brazil

# Examples #
examples %w|
189.19.75.58
189.41.178.137
189.2.51.154
189.111.151.65
201.30.137.133
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Winconnection V([^\s]+) \(server ([A-Z\d]{6})\)$/

		match=@meta["server"].scan(/^Winconnection V([^\s]+) \(server ([A-Z\d]{6})\)$/)

		# Version Detection
		m << { :version=>match[0][0] }

		# Server Detection
		m << { :string=>match[0][1] }

	end

	# Return passive matches
	m

end

end

