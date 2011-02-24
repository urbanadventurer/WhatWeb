##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fujitsu-InfoProvider-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-24
version "0.1"
description "Fujitsu-InfoProvider-Pro web server - homepage: http://software.fujitsu.com"

# ShodanHQ results as at 2011-02-24 #
# 188 for Fujitsu-InfoProvider-Pro

# Examples #
examples %w|
220.110.109.67
211.1.58.203
118.86.65.91
211.12.239.205
202.122.49.62
211.130.30.62
202.32.0.33
218.40.1.204
60.32.200.135
61.196.255.194
|

# Passive #
def passive
	m=[]

	# Server: Fujitsu-InfoProvider-Pro
	m << { :name=>"HTTP Server Header" } if @meta['server'] =~ /Fujitsu-InfoProvider-Pro/

	# Version Detection # HTTP Server Header
	m << { :version=>@meta['server'].scan(/Fujitsu-InfoProvider-Pro\/[V]?([^ ]+) /) } if @meta['server'] =~ /Fujitsu-InfoProvider-Pro\/[V]?([^ ]+) /

	# Return passive matches
	m
end

end

