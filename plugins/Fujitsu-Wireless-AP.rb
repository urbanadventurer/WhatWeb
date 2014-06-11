##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fujitsu-Wireless-AP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.1"
description "Fujitsu Wireless Access Point - Homepage: http://fenics.fujitsu.com/products/sr-m/"

# ShodanHQ results as at 2011-03-12 #
# 1 for SR-M20AP1
# 0 for SR-M20AC1



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^(SR-M20A[C|P]{1}1)$/

		# Model Detection
		m << { :model=>@headers["server"].scan(/^(SR-M20A[C|P]{1}1)$/) }

		# Firmware Version Detection # /hgi-bin/Setup/setup.cgi
		m << { :url=>"/hgi-bin/Setup/setup.cgi", :firmware=>@body.scan(/<TABLE cellspacing=0 cellpadding=0><TR><TD align="center"><A href="\/home.html"><IMG src="\/images\/logo.gif" alt="[^"]+" border=0><\/A><BR><FONT size='2'>SR-M20A[C|P]{1}1\(V([\d\.]+) config1\)<BR><\/FONT><\/TD><\/TR><TR><TH colspan=4><HR>/) } if @body =~ /<TABLE cellspacing=0 cellpadding=0><TR><TD align="center"><A href="\/home.html"><IMG src="\/images\/logo.gif" alt="[^"]+" border=0><\/A><BR><FONT size='2'>SR-M20A[C|P]{1}1\(V([\d\.]+) config1\)<BR><\/FONT><\/TD><\/TR><TR><TH colspan=4><HR>/

	end

	# Return passive matches
	m
end

end


