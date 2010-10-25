##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Squid-Web-Proxy-Cache" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. - homepage: http://www.squid-cache.org/"

# About 115253 ShodanHQ results for "Server: squid"
examples %w|
184.82.40.169
200.112.202.56
196.22.14.203
195.71.11.68
109.169.38.95
203.56.14.207
85.124.85.114
109.108.128.157
121.120.79.43
|

# HTTP Header
def passive
	m=[]

	# X-Squid-Error # Also used by iPrism, CachePower, and MecGuard 
	m << { :name=>"X-Squid-Error", :certainty=>25 } unless @meta["X-Squid-Error"].to_s.nil?
	m << { :name=>"x-squid-error", :certainty=>25 } unless @meta["x-squid-error"].to_s.nil?

	# Server
	m << { :version=>@meta["Server"].to_s.scan(/[\s]*Squid\/([^\r^\n]+)/i) } if @meta["Server"] =~ /[\s]*Squid\/([^\r^\n]+)/i
	m << { :version=>@meta["server"].to_s.scan(/[\s]*Squid\/([^\r^\n]+)/i) } if @meta["server"] =~ /[\s]*Squid\/([^\r^\n]+)/i

	m

end

end

