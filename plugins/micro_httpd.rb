##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "micro_httpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
description "micro_httpd is a very small Unix-based HTTP server. It runs from inetd, which means its performance is poor. But for low-traffic sites, it's quite adequate. It implements all the basic features of an HTTP server. - homepage: http://www.acme.com/software/micro_httpd/"

# About 957229 ShodanHQ results for "server: micro_httpd" @ 2010-10-26
examples %w|
78.162.53.58
197.224.112.230
183.89.22.130
97.75.128.112
190.98.45.133
41.140.25.69
94.43.137.3
190.95.122.49
89.249.219.51
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /^[\s]*micro_httpd/i
	m << { :name=>"HTTP Server Header" } if @meta["Server"].to_s =~ /^[\s]*micro_httpd/i

	m

end

end

