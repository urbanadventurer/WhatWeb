##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NetApp-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "NetApp network-attached storage solutions and a unified storage architecture can help solve your file-storage challenges and lower your costs. - Homepage: http://www.netapp.com/us/products/protocols/nas/nas.html"

# ShodanHQ results as at 2011-03-13 #
# 1,485 for NetApp -NetCache

# Examples #
examples %w|
158.102.161.153
163.117.131.201
129.10.116.9
169.236.151.110
89.238.71.254
204.12.115.184
206.251.171.61
63.231.195.122
129.74.223.99
208.50.232.51
220.73.139.185
211.63.185.8
218.24.6.177
124.243.127.141
123.190.234.18
60.22.151.142
217.11.56.190
206.251.170.254
68.68.103.52
216.94.32.208
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^NetApp\/[\/]?(.+)$/) } if @meta["server"] =~ /^NetApp\/[\/]?(.+)$/

	# Return passive matches
	m

end

end

