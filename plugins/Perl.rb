##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Added content-type application/perl match
##
Plugin.define "Perl" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Perl is a highly capable, feature-rich programming language with over 22 years of development. - homepage: http://www.perl.org/"

# About 309934 ShodanHQ results for "server: perl/v" @ 2010-10-26
examples %w|
168.158.43.171
213.199.225.48
132.203.210.197
64.62.215.124
114.31.74.154
209.195.7.213
83.169.38.211
85.214.34.154
212.73.155.133
89.36.142.15
78.137.165.66
216.120.243.74
216.40.254.78
195.211.68.24
64.91.245.238
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i

	# HTTP Content-Type Header
	m << { :name=>"application/perl" } if @meta["content-type"] =~ /application\/perl/i

	m

end

end

