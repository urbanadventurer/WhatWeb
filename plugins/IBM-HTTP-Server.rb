##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IBM-HTTP-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "IBM HTTP Server"

# 23022 ShodanHQ results for "Server: IBM_HTTP_Server"
# 34 ShodanHQ results for "srvrname:"
examples %w|
12.44.59.57
207.19.62.173
207.19.62.130
12.44.59.92
207.19.62.147
12.44.59.23
207.19.62.129
207.19.62.157
207.19.62.175
12.44.59.145
204.54.192.13
208.28.133.146
65.79.18.14
27.110.79.44
167.68.39.142
194.31.225.119
85.236.67.201
66.101.206.73
217.220.71.166
205.172.134.48
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["Server"].scan(/[\s]*IBM-HTTP-Server\/([\d\.]+)/) } if @meta["Server"] =~ /[\s]*IBM-HTTP-Server\/([\d\.]+)[^\r^\n]*/
	m << { :version=>@meta["server"].scan(/[\s]*IBM-HTTP-Server\/([\d\.]+)/) } if @meta["server"] =~ /[\s]*IBM-HTTP-Server\/([\d\.]+)[^\r^\n]*/
	m << { :version=>@meta["Server"].scan(/[\s]*IBM_HTTP_Server\/([\d\.]+)/) } if @meta["Server"] =~ /[\s]*IBM_HTTP_Server\/([\d\.]+)[^\r^\n]*/
	m << { :version=>@meta["server"].scan(/[\s]*IBM_HTTP_Server\/([\d\.]+)/) } if @meta["server"] =~ /[\s]*IBM_HTTP_Server\/([\d\.]+)[^\r^\n]*/
	m << { :name=>"IBM_HTTP_Server" } if @meta["server"].to_s =~ /^[\s]*IBM_HTTP_Server/
	m << { :name=>"IBM_HTTP_Server" } if @meta["Server"].to_s =~ /^[\s]*IBM_HTTP_Server/

	# srvrname
	m << { :module=>@meta["srvrname"].to_s } unless @meta["srvrname"].nil?

	m

end

end

