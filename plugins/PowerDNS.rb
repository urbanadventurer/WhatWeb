##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerDNS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "PowerDNS is a high performance, non-BIND nameserver written in c++ - Homepage: http://www.powerdns.com/"

# ShodanHQ results as at 2011-05-20 #
# 12 for PowerDNS

# Examples #
examples %w|
130.161.143.163
210.57.208.4
204.232.198.253
200.98.246.51
188.65.113.8
|

# Passive #
def passive
	m=[]

	# WWW-Authenticate: Basic realm="PowerDNS" 
	m << { :name=>"WWW-Authenticate realm" } if @meta["www-authenticate"] =~ /^Basic realm="PowerDNS"$/

	# Return passive matches
	m
end

end

