##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Boa-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "Boa Webserver - Do You Feel the Need for Speed? Boa currently seems to be the favorite web server in the embedded crowd, and embedded Linux, despite all the marketing hype, really is a big deal. Supposedly, an older version of Boa, v0.92q, runs in 32K address space on m68k, like used in uCLinux. - homepage: http://www.boa.org/"

# About 176872 ShodanHQ results for "server: boa" @ 2010-10-26
examples %w|
190.42.155.28
201.230.8.154
190.233.84.141
201.240.103.112
109.125.220.249
201.63.95.252
94.231.182.208
201.240.104.107
193.165.154.214
64.187.75.237
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*Boa\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /^[\s]*Boa\/([^\s^\r^\n]+)/i
	m << { :version=>@meta["Server"].to_s.scan(/^[\s]*Boa\/([^\s^\r^\n]+)/i).to_s } if @meta["Server"].to_s =~ /^[\s]*Boa\/([^\s^\r^\n]+)/i

	m

end

end

