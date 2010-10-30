##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DeleGate" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.1"
description "This plugin retrieves the author name from the meta name tag - info: http://www.webmarketingnow.com/tips/meta-tags-uncovered.html#author"

# About 196 ShodanHQ results for "DeleGate-Ver" @ 2010-10-30
examples %w|
132.204.42.200
132.204.42.201
132.204.42.202
132.204.42.203
132.204.42.204
132.204.42.206
132.204.42.207
132.204.42.208
132.204.42.209
132.204.42.234
217.29.160.12
211.16.122.162
122.219.129.12
114.145.160.210
132.204.42.220
62.245.234.141
168.210.113.61
|

# Passive # HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].scan(/^[\s]*DeleGate\/([\d\.]+)/) } if @meta["server"] =~ /^[\s]*DeleGate\/([\d\.]+)/

	# DeleGate-Ver
	m << { :version=>@meta["delegate-ver"].scan(/^[\s]*([\d\.]+) \(delay=[0-9]*\)/) } if @meta["delegate-ver"] =~ /^[\s]*([\d\.]+) \(delay=[0-9]*\)/

	m

end

end

