##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetTalk-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-23
version "0.1"
description "Webserver using NetTalk. NetTalk is the de-facto standard tool for TCP/IP networking in Clarion. - Homepage: http://www.capesoft.com/docs/NetTalk/nettalk.htm"
# More info: http://www.capesoft.com/docs/nettalk/nettalkwebbasic.htm

# ShodanHQ results as at 2011-05-23 #
# 146 for NetTalk-WebServer

# Examples #
examples %w|
www.capesoft.com
173.160.90.178
130.225.3.112
87.66.13.251
213.125.24.99
129.119.81.37
213.76.161.14
130.225.3.116
202.165.89.24
75.76.215.198
213.97.139.184
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NetTalk-WebServer\/([\d\.]+)$/) } if @headers["server"] =~ /^NetTalk-WebServer\/([\d\.]+)$/

	# Return passive matches
	m
end

end

