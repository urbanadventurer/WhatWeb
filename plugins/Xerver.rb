##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xerver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "Xerver is an advanced free GNU GPL Web and FTP server. - Homepage: http://www.javascript.nu/xerver/"

# ShodanHQ results as at 2011-05-20 #
# 182 for Xerver

# Examples #
examples %w|
24.72.92.19
122.52.101.11
74.218.83.38
173.17.200.112
85.65.85.113
87.208.119.231
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Xerver\/([\d\.]+)$/) } if @headers["server"] =~ /^Xerver\/([\d\.]+)$/

	# Return passive matches
	m
end

end

