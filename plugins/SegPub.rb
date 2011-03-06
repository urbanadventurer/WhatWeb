##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SegPub" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-19
version "0.1"
description "SegPub, a hosting solutions provider based in Sydney, Australia - Homepage: http://segpub.net/"

# ShodanHQ resuls as at 2011-02-19 #
# 458 for Server SegPache
# 299 for X-Powered-By SegPub
# 273 for X-Powered-By SegPub Server SegPache
# 4   for X-Powered-By SegPod

# Examples #
examples %w|
65.61.176.66
65.61.176.118
66.216.83.164
66.216.83.170
66.216.93.163
66.216.83.165
66.216.103.206
66.216.93.188
66.216.93.186
66.216.103.216
|

# Passive #
def passive
	m=[]

	# Server: SegPache
	m << { :string=>"OS:FreeBSD7" } if @meta['server'] =~ /SegPache/

	# X-Powered-By: SegPub
	m << { :string=>"OS:FreeBSD7" } if @meta['x-powered-by'] =~ /SegPub/

	# X-Powered-By: SegPod
	m << { :string=>"OS:FreeBSD7" } if @meta['x-powered-by'] =~ /SegPod/

	# Return passive matches
	m

end

end


