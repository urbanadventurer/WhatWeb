##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Perl" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.1"
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
|

# HTTP Header
def passive
	m=[]

	# Server
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i
	m << { :version=>@meta["Server"].to_s.scan(/[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i).to_s } if @meta["Server"].to_s =~ /[^\r^\n]*Perl\/v([^\s^\r^\n]+)/i

	m

end

end

