##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "nginx" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Nginx (Engine-X) is a free, open-source, high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server. - Homepage: http://nginx.net/"

# ShodanHQ results as at 2011-03-13 #
# 289,545 for nginx

# Examples #
examples %w|
121.14.176.28
50.16.215.176
173.230.133.226
213.5.185.191
209.190.31.117
46.62.226.231
173.224.218.183
93.174.6.147
194.126.241.10
95.169.190.66
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^nginx$/

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^nginx\/([^\s]+)$/) } if @meta["server"] =~ /^nginx\/([^\s]+)$/

	# Return passive matches
	m

end

end

