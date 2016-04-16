##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-06 #
# Updated OS detection
##
Plugin.define "SegPub" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-19
version "0.2"
description "SegPub, a hosting solutions provider based in Sydney, Australia"
website "http://segpub.net/"

# ShodanHQ resuls as at 2011-02-19 #
# 458 for Server SegPache
# 299 for X-Powered-By SegPub
# 273 for X-Powered-By SegPub Server SegPache
# 4   for X-Powered-By SegPod



# Passive #
def passive
	m=[]

	# Server: SegPache
	m << { :os=>"FreeBSD7" } if @headers['server'] =~ /SegPache/

	# X-Powered-By: SegPub
	m << { :os=>"FreeBSD7" } if @headers['x-powered-by'] =~ /SegPub/

	# X-Powered-By: SegPod
	m << { :os=>"FreeBSD7" } if @headers['x-powered-by'] =~ /SegPod/

	# Return passive matches
	m

end

end


