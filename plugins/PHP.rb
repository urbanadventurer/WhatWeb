##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-19 #
# Updated regex matches
##
Plugin.define "PHP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "PHP is a widely-used general-purpose scripting language that is especially suited for Web development and can be embedded into HTML. - homepage: http://www.php.net/"

# About 3,838,895 ShodanHQ results for "server: PHP" @ 2010-10-26
# About 2,343,143 ShodanHQ results for "X-Powered-By: PHP" @ 2010-10-26

# Examples #
examples %w|
129.217.108.130
202.235.202.65
81.169.165.201
88.191.98.199
69.46.9.245
210.158.243.55
72.13.88.196
67.222.45.85
129.121.70.1
96.46.184.46
81.169.173.100
209.205.127.135
77.104.173.253
96.0.245.3
95.187.225.232
195.42.102.207
116.58.194.4
64.130.117.21
|

# Passive #
def passive
	m=[]

	# HTTP # Server
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*PHP\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*PHP\/([^\s^\r^\n]+)/i

	# HTTP # X-Powered-By
	m << { :version=>@meta["x-powered-by"].to_s.scan(/[^\r^\n]*PHP\/([^\s^\r^\n]+)/i).to_s } if @meta["x-powered-by"].to_s =~ /[^\r^\n]*PHP\/([^\s^\r^\n]+)/i

	m

end

end

