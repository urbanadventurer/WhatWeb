##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TAC-Xenta-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "SCADA - The TAC Xenta devices are multifunctional control systems with an embedded web server that allows you to access your control application and configuration pages via a web browser anywhere in the world, anytime. - Homepage: http://www.tac.com/ap/Navigate?node=1656"

# Examples #
examples %w|
69.74.110.203
81.167.212.78
199.212.253.20
81.224.64.126
77.252.232.89
12.50.90.119
82.103.207.17
129.120.253.229
82.103.207.14
87.105.213.136
99.69.149.86
83.251.31.177
87.205.124.28
62.240.71.123
81.94.74.6
199.212.253.10
62.242.17.110
134.29.140.42
173.15.116.181
70.108.251.200
83.100.79.86
198.166.47.109
188.179.102.58
212.242.178.177
90.145.71.18
83.238.167.8
194.182.4.175
213.35.215.61
168.179.200.147
83.238.167.89
213.81.137.46
87.205.20.164
82.103.207.21
188.126.227.238
82.103.207.28
83.252.159.219
69.219.216.161
193.251.56.161
99.37.255.97
|

# Matches #
matches [

# Home Page # Default HTML
{ :text=>'<html><body><script>var url="https://"+location.hostname+"/www/index/Slogin.html";location.href=url;</script></body></html>' },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^TAC\/Xenta([\d]{3}|[\d]{3}-[A-Z]{3}) [\d\.]{4}/
		m << { :model=>@meta["server"].scan(/^TAC\/Xenta([\d]{3}|[\d]{3}-[A-Z]{3}) [\d\.]{4}/) }
		m << { :firmware=>@meta["server"].scan(/^TAC\/Xenta[^\ ]+ ([\d\.]{4})/) }
	end

	# Return passive matches
	m
end

end


