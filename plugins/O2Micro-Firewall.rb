##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "O2Micro-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "SifoWorks is a multi-function security gateway system that is based on O2Micro's powerful ASIC design. Apart from its firewall capabilities, SifoWorks is also equipped with several industry-leading security features such as: activating NAT and policy routing concurrently while maintaining line speed processing capability; effective log system; powerful network security mechanism, protection against ARP attacks, content filtering, IDP, DoS / DDoS protection, P2P / IM control, etc. - Homepage: http://www.o2security.com/product/productclass.php?classfiy_sn=73"

# ShodanHQ results as at 2011-03-18 #
# 95 for CGISESSID 01010011111100000000111110010011
# 41 for O2micro 01010011111100000000111110010011
# 54 for Firewall/2.3.33
# 54 for Firewall 01010011111100000000111110010011
# 54 for Firewall CGISESSID

# Examples #
examples %w|
220.248.209.47
218.28.142.166
218.28.142.162
124.42.110.200
123.71.192.158
124.42.11.249
222.180.172.81
222.177.247.65
124.74.45.22
115.31.136.37
115.31.136.32
220.248.209.47
218.28.142.166
163.30.31.30
120.36.0.50
218.28.142.162
210.240.147.101
124.42.110.200
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^(O2micro|Firewall)\/([\d\.]+)/)[0][1] } if @meta["server"] =~ /^(O2micro|Firewall)\/([\d\.]+)/

	# HTTP Server Header and Cookie
	if @meta["set-cookie"] =~ /^CGISESSID=01010011111100000000111110010011;/ and @meta["server"] =~ /^(O2micro|Firewall)/
		m << { :name=>"HTTP Server Header and Cookie" }
	end

	# Return passive matches
	m
end

end

