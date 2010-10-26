##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cisco-IOS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Cisco IOS (originally Internetwork Operating System) is the software used on the vast majority of Cisco Systems routers and current Cisco network switches. (Earlier switches ran CatOS.) IOS is a package of routing, switching, internetworking and telecommunications functions tightly integrated with a multitasking operating system. - More info: http://en.wikipedia.org/wiki/Cisco_IOS"

# About 284567 ShodanHQ results for "server: cisco-IOS" @ 2010-10-26
examples %w|
96.61.214.8
122.227.189.246
199.2.209.61
202.6.154.2
216.244.169.38
199.216.192.128
91.206.162.13
95.14.189.62
65.61.46.1
195.133.224.193
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /^[\s]*cisco-IOS/
	m << { :name=>"HTTP Server Header" } if @meta["Server"].to_s =~ /^[\s]*cisco-IOS/

	m

end

end

