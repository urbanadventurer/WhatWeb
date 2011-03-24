##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WhatsUp" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "WhatsUp - Network and Server Management Software - Homepage: http://www.whatsupgold.com/"

# ShodanHQ results as at 2011-03-13 #
# 1,127 for WhatsUp -Gold
#   647 for WhatsUp -ipswitch

# Examples #
examples %w|
24.123.107.231
200.38.185.50
200.32.77.68
69.51.102.5
152.149.43.57
204.196.236.45
168.212.252.39
202.181.209.134
158.182.2.41
210.114.174.29
41.78.103.7
38.120.1.254
138.202.175.25
200.55.251.204
212.138.86.44
65.210.151.67
199.104.207.3
38.118.23.21
88.248.158.85
62.159.38.7
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :string=>"Gold", :version=>@meta["server"].scan(/^WhatsUp_Gold\/([\d\.]+)/) } if @meta["server"] =~ /^WhatsUp_Gold\/([\d\.]+)/

	# WWW-Authenticate # HTTP Server Header
	m << { :string=>"Gold", :certainty=>75, :name=>"WWW-Authenticate" } if @meta["www-authenticate"] =~ /^Basic realm="WhatsUp[\s]?Gold"/

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^WhatsUp/

	# Return passive matches
	m

end

end

