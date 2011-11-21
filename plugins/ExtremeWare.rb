##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ExtremeWare" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-21
version "0.1"
description "Extreme Networks ExtremeWare device - Homepage: http://www.extremenetworks.com/services/software-userguide.aspx"

# ShodanHQ results as at 2011-11-21 #
# 250 for ExtremeWare

# Google results as at 2011-11-21 #
# 50 for intitle:"ExtremeWare Management Interface"

# Dorks #
dorks [
'intitle:"ExtremeWare Management Interface"'
]

# Examples #
examples %w|
146.83.197.97
169.236.152.4
169.236.136.4
68.69.31.1
204.141.8.154
199.204.32.189
83.167.165.115
216.105.120.65
206.221.153.254
202.82.157.38
146.83.195.129
146.83.197.193
200.0.145.129
146.83.193.1
146.83.197.225
146.83.193.193
146.83.197.97
146.83.197.161
146.83.197.33
146.83.197.1
65.99.204.22
146.83.195.126
wsf-switch1.wharton.upenn.edu
195.148.235.230
121.192.0.1
146.83.197.65
200.0.145.1
146.83.194.1
62.241.33.1.rev.worldbone.de
146.83.193.129
gw-backbone-1.guetali.net
139.84.171.245
139.82.71.193
91.138.160.90
146.83.193.65
146.83.196.3
38.100.176.226
163.29.241.163
200.225.157.216
200.18.33.161
146.83.199.129
146.83.194.129
196.12.158.1
210.212.5.80
x42073609.ip.e-nt.net
202.125.176.81
200.0.145.65
163.17.224.250
82.210.2.1.rev.worldbone.de
66.197.149.7
gw-backbone-1.guetali.net
139.84.171.245
139.82.71.193
91.138.160.90
146.83.193.65
146.83.196.3
38.100.176.226
163.29.241.163
200.225.157.216
200.18.33.161
146.83.199.129
146.83.194.129
196.12.158.1
210.212.5.80
x42073609.ip.e-nt.net
202.125.176.81
200.0.145.65
163.17.224.250
82.210.2.1.rev.worldbone.de
66.197.149.7
173.245.89.254
146.83.197.129
221.2.0.2
165.123.34.3
155.230.18.2
132.248.131.253
einstein.fisica.furg.br
router.scps.tpc.edu.tw
sw.facd.ubiobio.cl
|

# Matches #
matches [

# Version Detection # HTTP Server Header
{ :search=>"headers[server]", :version=>/^ExtremeWare\/([^\s]+)$/ },

# /Images/extremelogan
{ :md5=>"a18d6970836e3302e4d6d085e8f9d31b", :url=>"/Images/extremelogan" },
{ :md5=>"bf368990304c878ce2924bc21b3f06d9", :url=>"/Images/extremelogan" },

# / # Title
{ :text=>'<title>ExtremeWare Management Interface</title>' },

# /extremetop # Logo HTML
{ :text=>'<center><img src="Images/extremelogan"><a href="extremebasepage" target="_top"><h2>Logon</h2></a><P><P><TABLE BORDER="0"><TR><TD NOWRAP><TT><FONT COLOR="#000000">' },

]

end

