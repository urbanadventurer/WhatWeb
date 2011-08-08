##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Varnish" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "Varnish is an HTTP accelerator written in C designed for content-heavy dynamic web sites. In contrast to other HTTP accelerators, such as Squid, which began life as a client-side cache, or Apache, which is primarily an origin server, Varnish was designed from the ground up as an HTTP accelerator. - Homepage: http://www.varnish-cache.org/"

# ShodanHQ results as at 2011-04-15 #
# 14,040 for X-Varnish

# Examples #
examples %w|
46.59.89.104
46.183.140.79
75.101.139.14
50.17.218.109
64.92.222.27
65.75.148.51
213.218.127.234
69.25.189.139
74.86.155.247
201.7.178.145
|

# Passive #
def passive
	m=[]

	# X-Varnish Header
	m << { :name=>"X-Varnish Header" } unless @headers["x-varnish"].nil?

	# Server Header
	m << { :name=>"Server Header" } if @headers["server"] =~ /^Varnish$/

	# Return passive matches
	m
end

end

