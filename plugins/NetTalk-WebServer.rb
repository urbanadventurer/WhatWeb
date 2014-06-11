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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NetTalk-WebServer\/([\d\.]+)$/) } if @headers["server"] =~ /^NetTalk-WebServer\/([\d\.]+)$/

	# Return passive matches
	m
end

end

