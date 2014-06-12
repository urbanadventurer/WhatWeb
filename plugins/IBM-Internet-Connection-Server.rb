##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-Internet-Connection-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "IBM Internet Connection Server - Homepage [offline] : http://www.ics.raleigh.ibm.com"

# ShodanHQ results as at 2011-06-07 #
# 3 for ibm internet connection server -IBM_HTTP_Server



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^IBM Internet Connection Server\/([^\s]+)$/) } if @headers["server"] =~ /^IBM Internet Connection Server\/([^\s]+)$/

	# Return passive matches
	m
end

end

