##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Rabbit-Microcontroller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Rabbit Semiconductor is the company which designs and sells the Rabbit family of microcontrollers and microcontroller modules. For development, it provides Dynamic C, a non-standard dialect of C with proprietary structures for multitasking."
website "http://www.rabbitconsulting.com/"
# More info: http://en.wikipedia.org/wiki/Rabbit_Semiconductor

# ShodanHQ results as at 2011-04-08 #
# 2, 557 for Z-World Rabbit



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Z-World Rabbit$/

		m << { :name=>"HTTP Server Header" }

		# MAC Address Detection
		m << { :string=>@body.scan(/<TR><TD>MAC ID:<\/TD><TD>([A-F\d]{12})<\/TD><\/TR>/) } if @body =~ /<TR><TD>MAC ID:<\/TD><TD>[A-F\d]{12}<\/TD><\/TR>/

		# Version Detection
		m << { :version=>@body.scan(/<body><\/img><P align="center"><FONT size="5">Welcome to the OCMR(-SNMP)?[\s]+Agent V([\d\.]+)<\/FONT><\/P>/)[0][1] } if @body =~ /<body><\/img><P align="center"><FONT size="5">Welcome to the OCMR(-SNMP)?[\s]+Agent V([\d\.]+)<\/FONT><\/P>/

	end

	# Return passive matches
	m
end

end

