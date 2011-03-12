##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Raptor-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Raptor Firewall (previously known as Raptor EagleNT) was acquired by Symantec and has been discontinued - Homepage: http://www.symantec.com/en/nz/business/support/overview.jsp?pid=52789"

# ShodanHQ results as at 2011-03-13 #
# 55,684 for Simple, Secure Web Server

# Examples #
examples %w|
167.251.107.85
167.251.253.30
167.251.158.124
167.251.218.111
167.251.21.41
213.183.80.255
167.251.9.88
167.251.124.155
167.251.207.116
167.251.200.7
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Simple, Secure Web Server (.+)$/) } if @meta["server"] =~ /^Simple, Secure Web Server (.+)$/

	# Return passive matches
	m

end

end

