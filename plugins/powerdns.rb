##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PowerDNS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "PowerDNS is a high performance, non-BIND nameserver written in c++"
website "http://www.powerdns.com/"

# ShodanHQ results as at 2011-05-20 #
# 12 for PowerDNS



# Passive #
def passive
	m=[]

	# WWW-Authenticate: Basic realm="PowerDNS" 
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Basic realm="PowerDNS"$/

	# Return passive matches
	m
end

end

