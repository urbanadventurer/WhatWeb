##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated model detection
# Added frameset match
##
Plugin.define "Brother-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Brother printer web interface - homepage: http://www.brother.com/"
# Default login: Admin/Access

# 57 results for intitle:"Brother" intext:"View Configuration" intext:"Brother Industries, Ltd." @ 2010-07-22
# 23 results for inurl:"printer/main.html" intext:"settings" @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=872
# About 1,661 shodan results for printer Server:debut @ 2010-07-22

# Examples #
examples %w|
144.214.177.35
133.50.196.101
160.94.174.35
71.43.174.35
141.2.61.226
207.59.155.35
132.176.151.35
133.87.144.35
128.175.138.35
128.125.36.141
198.82.232.174
136.142.54.132
141.2.161.148
152.3.193.78
129.25.5.213
212.106.189.219
129.217.163.100
134.100.221.198
69.104.99.234
216.231.38.73
oldstock.nl
128.208.18.51
134.100.221.164
129.27.184.89
155.54.210.83
129.25.13.42
216.231.38.73
cs.codesapien.com
www.storm-frog.com
198.82.232.174
www.shadowmonkey.com
130.209.164.163
69.104.99.234
129.27.167.77
129.25.26.251
129.25.6.48
129.25.12.75
128.125.25.112
129.25.22.208
129.25.24.239
152.3.216.166
141.54.178.17
152.3.193.78
128.125.23.96
www.byraquel.com
129.25.59.157
141.26.71.159
212.182.1.37
130.209.164.166
h200137209222.ufg.br
130.236.72.32
129.22.210.100
|

# Matches #
matches [

	# Framset # Header frame
	{ :text=>'<FRAME SRC="/printer/inc_head.html" NAME="header" NORESIZE SCROLLING="no">' },

	# Model Detection # HL-40xx series # Default image HTML
	{ :text=>'<IMG src="/common/image/HL4040CN.gif" border=0>', :model=>"HL-4040CN" },
	{ :text=>'<IMG src="/common/image/HL4040CDN.gif" border=0>', :model=>"HL-4040CDN" },
	{ :text=>'<IMG src="/common/image/HL4050CDN.gif" border=0>', :model=>"HL-4050CDN" },
	{ :text=>'<IMG src="/common/image/HL4070CDW.gif" border=0>', :model=>"HL-4070CDW" },

	# Model Detection # HL-1x / HL-2x / HL-5x / HL-6x series
	# Tested models: HL-6050D_DN / HL-5370DW / HL-5250DN / HL-5250DN /  HL-5270DN / HL-5370DW / HL-1650_1670N / HL-2150N / HL-2460 / HL-2170W / HL-2070N
	# This regex could be improved
	{ :model=>/<TITLE>Brother ([0-9A-Z\-\_]+) series[\ \(\ SLEEP\ \)|\ \(\ PAUSE\ \)|\ \(\ READY\ \)]*<\/TITLE>/ },

]

end

