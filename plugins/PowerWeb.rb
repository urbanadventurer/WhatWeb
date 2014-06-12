##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "PowerWeb is a full 128-bit secure server with unlimited RSA encryption using industry standard SSL 3.0 (and 2.0), providing HTTP, FTP, SMTP and POP3 services, with many extensions for rapid database application development and dynamic page content. - Homepage: http://www.compusource.co.za/powerweb/"

# ShodanHQ results as at 2011-06-04 #
# 1 for PowerWeb/4



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^PowerWeb\/([^\s]+)$/) } if @headers["server"] =~ /^PowerWeb\/([^\s]+)$/

	# Return passive matches
	m
end

end

