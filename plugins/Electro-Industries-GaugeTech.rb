##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Electro-Industries-GaugeTech" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-09
version "0.1"
description "Electro Industries GaugeTech Device - Electro Industries meters are known world-wide for their ease of use, advanced power functionality and reliable service. - Homepage: http://www.electroind.com/"

# ShodanHQ results as at 2011-03-09 #
# 102 for EIG Embedded Web Server

# Examples #
examples %w|
152.7.145.62
152.7.145.64
134.129.172.131
12.139.228.229
134.129.192.141
134.129.162.34
152.14.50.50
134.129.132.114
152.7.142.46
152.7.145.69
152.7.144.30
132.248.11.7
134.129.191.183
152.7.145.68
152.7.145.70
152.7.145.86
152.7.145.67
132.248.243.103
134.129.186.220
134.129.187.200
152.7.146.32
134.129.133.28
134.129.170.248
134.129.193.140
76.193.247.182
134.129.177.254
152.7.144.27
134.129.143.179
134.129.194.229
152.1.236.84
134.129.171.64
134.129.191.184
152.7.145.63
200.3.201.244
134.129.187.132
152.7.143.35
134.129.208.5
134.129.208.6
134.129.208.7
134.129.208.8
134.129.208.9
134.129.208.10
134.129.208.11
134.129.208.12
134.129.208.13
134.129.208.14
134.129.208.15
134.129.208.16
134.129.208.17
134.129.208.18
134.129.208.19
134.129.208.20
134.129.208.21
134.129.208.22
134.129.173.57
|

# Matches #
matches [

# Model Detection # Nexus # /meter_information.htm
{ :url=>"/meter_information.htm", :model=>/<td width=135 bgcolor="#000000"><b><font face="Verdana" size="2" color="#FF0000">&nbsp;Device[\s\r\n]*Type<\/font><\/b><\/td>[\s\r\n]*<td width=150 bgcolor="#CCCCCC">[\s\r\n]*<div align="center"><font color="#000000" size="2" face="Verdana">[\s\r\n]*([^\r^\n]+)[\s\r\n]*<\/font><\/div>/ },

# Model Detection # Shark # /meter_information.htm
{ :url=>"/meter_information.htm", :model=>/<td width=108 bgcolor="#B9BEC2"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#990000">&nbsp;[\s\r\n]*Device Type<\/font><\/b><\/td>[\s\r\n]*<td width=150 bgcolor="#FFFFFF"><div align="center"><font color="#000000" size="1" face="Verdana, Arial, Helvetica, sans-serif">[\s\r\n]*([^\r^\n^\s^<]{3,5})[^<]*<\/font><\/div>/, :string=>"Shark" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server Header" } if @meta["server"] =~ /^EIG Embedded Web Server$/

	# Return passive matches
	m
end

end


