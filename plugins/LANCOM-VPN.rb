##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
Plugin.define "LANCOM-VPN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.2"
description "Administration of dynamic IP addresses by LANCOM Dynamic VPN devices. Revolutionary in the LANCOM Dynamic VPN technology is that fixed IP addresses are no longer needed: The IP addresses of the respective IPSec gateways are exchanged over ISDN before the connection is established. Internet-based VPN connections thereby escape the restriction of fixed and thus expensive IP addresses."
website "http://www.lancom.es/LANCOM-VPN.279.0.html"

# ShodanHQ results as at 2011-03-13 #
# 12,416 for LANCOM VPN


matches [
	# HTTP Server Header
	{ :regexp=>/^LANCOM.*VPN/, :search=>"headers[server]" },

	# Model Detection
	{ :model=>/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/, :offset=>0, :search=>"headers[server]" },

	# Version Detection
	{ :version=>/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/, :offset=>2, :search=>"headers[server]" },

	# Date Detection
	{ :string=>/^LANCOM ([\d]{4}[\+]?) VPN( \([^\)]+\))? ([\d\.]+) \/ ([\d]{2}.[\d]{2}.[\d]{4})$/, :offset=>3, :search=>"headers[server]" },

]

end

