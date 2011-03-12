##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LANCOM-VPN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Administration of dynamic IP addresses by LANCOM Dynamic VPN devices. Revolutionary in the LANCOM Dynamic VPN technology is that fixed IP addresses are no longer needed: The IP addresses of the respective IPSec gateways are exchanged over ISDN before the connection is established. Internet-based VPN connections thereby escape the restriction of fixed and thus expensive IP addresses. - Homepage: http://www.lancom.es/LANCOM-VPN.279.0.html"

# ShodanHQ results as at 2011-03-13 #
# 12,416 for LANCOM VPN

# Examples #
examples %w|
87.193.163.178
80.156.200.130
83.64.76.20
195.243.143.67
195.127.174.62
85.125.86.254
62.154.143.98
217.92.155.127
178.250.192.220
195.243.55.74
88.76.227.210
217.92.140.219
80.153.158.84
217.93.32.170
87.139.199.76
87.139.220.3
87.79.73.166
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/

		# Model Detection
		m << { :model=>@meta["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][0] }

		# Version Detection
		m << { :version=>@meta["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][2] }

		# Date Detection
		m << { :string=>@meta["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][3] }

	end

	# Return passive matches
	m

end

end

