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



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/

		# Model Detection
		m << { :model=>@headers["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][0] }

		# Version Detection
		m << { :version=>@headers["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][2] }

		# Date Detection
		m << { :string=>@headers["server"].scan(/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/)[0][3] }

	end

	# Return passive matches
	m

end

end

