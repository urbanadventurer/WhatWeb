##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OKI-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "OKI printer - Homepage: http://www.okiprintingsolutions.com/"

# ShodanHQ results as at 2011-05-31 #
# 240 for OKIDATA-HTTPD



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^OKIDATA-HTTPD\/([^\s]+)$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^OKIDATA-HTTPD\/([^\s]+)$/) }

		# Model Detection
		m << { :model=>@body.scan(/<title>([^<]+)<\/title>/) } if @body =~ /<title>([^<]+)<\/title>/

	end

	# Return passive matches
	m
end

end

# An aggressive plugin could retrieve additional information from /status.htm
# Including MAC address, active services (web/snmp), serial number, version, etc

