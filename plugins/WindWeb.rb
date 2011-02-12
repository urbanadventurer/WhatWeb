##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WindWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "WindWeb Webserver"

# About 21746 ShodanHQ results for "server: WindWeb" @ 2010-10-26
examples %w|
200.127.173.191
69.50.53.242
59.173.148.53
74.219.67.55
91.122.72.133
71.181.124.27
12.156.196.194
66.181.117.186
201.229.38.195
69.195.60.45
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/^[\s]*WindWeb\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /^[\s]*WindWeb\/([^\s^\r^\n]+)/i

	m

end

end

