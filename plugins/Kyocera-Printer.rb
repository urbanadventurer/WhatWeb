##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kyocera-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Web interface for Kyocera printers. Some models have built in fax and scanner capabilities. - Homepage: http://global.kyocera.com/"

# ShodanHQ results as at 2011-05-31 #
# 1,324 for KM-MFP-http

# Examples #
examples %w|
141.30.144.140
141.219.38.32
208.107.40.118
130.132.196.235
168.103.46.140
147.156.177.64
131.246.185.164
63.228.188.162
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^KM-MFP-http\/V([\d\.]+)$/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^KM-MFP-http\/V([\d\.]+)$/) }

		# Model Detection
		m << { :model=>@body.scan(/^var ModelName="([^"]+)";/) } if @body =~ /^var ModelName="([^"]+)";/

	end

	# Return passive matches
	m
end

end

