##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated model detection
##
Plugin.define "HP-LaserJet-Printer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "HP LaserJet printer web interface - homepage: http://www.hp.com/"

# 109 Google results for inurl:hp/device/this.LCDispatcher @ 2010-07-22
# http://www.hackersforcharity.org/ghdb/?function=detail&id=615

# ShodanHQ results #
# 21,276 for Server:HP-ChaiSOE ONNECTION @ 2010-07-22
# 17,235 for Server ChaiServer @ 2011-02-19

# Examples #
examples %w|
211.181.56.6
143.248.134.156
128.205.136.130
131.188.202.79
216.127.125.150
161.6.37.222
159.149.25.113
129.237.236.68
198.128.44.216
66.213.4.3
128.125.4.223
68.181.150.65
137.229.181.35
192.107.181.35
150.216.248.221
134.114.178.35
144.92.165.170
211.227.240.235
129.241.176.35
131.123.120.197
130.64.90.49
128.171.180.41
128.171.36.107
128.193.168.33
128.193.168.34
128.193.168.48
128.91.222.192
129.25.8.142
129.59.217.19
129.97.176.54
130.236.195.235
131.123.120.204
131.216.111.131
131.96.145.77
140.109.152.93
140.112.46.85
140.116.162.156
140.117.156.138
140.123.62.13
140.135.112.218
140.247.102.41
143.229.42.29
147.32.86.239
1513a.mis.yzu.edu.tw
152.2.188.10
152.3.116.95
152.3.238.154
152.3.239.171
152.3.239.172
159.149.209.81
163.13.164.1
163.17.10.181
165.132.29.49
68.181.148.21
68.181.148.227
68.181.149.81
87.97.65.40
b700a.uio.no
dns.kikidu.com
fbb1.fh-erfurt.de
hep0.uibk.ac.at
hercules.aston.ac.uk
hp4515.morselli.unimo.it
joshuatree.cpos.ucsb.edu
karherb.uio.no
lj5200-arch.westphal.drexel.edu
128.173.241.147
128.2.125.249
129.215.143.14
129.237.40.251
129.237.40.252
129.240.18.87
129.241.64.118
130.160.234.98
130.237.93.9
132.208.131.27
141.212.158.94
142.28.12.69
146.229.234.96
146.48.102.143
147.162.125.111
152.2.182.204
152.3.116.90
193.147.179.240
194.226.191.107
195.113.32.30
68.181.148.100
68.181.148.180
aux.uwm.edu
biolp4.uio.no
dnr-biokj-k6-color.uio.no
hp3005-cox312b.pams.ncsu.edu
jens.uio.no
jur-dn-kurs.uio.no
la123d.uwyo.edu
red.uv.es
w090.z064000036.nyc-ny.dsl.cnc.net
www.cbld.com
www.cahillwealth.com
|

# Matches #
matches [

# Default logo HTML
{ :text=>'<img src="images/logo.gif" alt="Click this Hewlett-Packard logo to open a new browser window, which takes you to the external HP.com Web site." /></a>' },

# Default Navigation HTML
{ :text=>'<a href="#skipnavigation" title="Jump to main content. Please activate this if you would like to skip the navigation and jump directly to the main content."></a><a href="http://www.hp.com" onclick="target = new Date().valueOf().toString(); if (window.open) window.open(\'http://www.hp.com\',target,\'resizable=yes,scrollbars=yes,menubar=yes,location=yes,toolbar=yes,status=yes\'); return false;" title="Go to HP corporate web site: external link">' },

{ :text=>'HP 9250C Digital Sender Series</title>', :model=>"9250C Digital Sender" },

{ :text=>'hp 9200C Digital Sender</title>', :model=>"9200C Digital Sender" },

# Model Detection
{ :model=>/<title>[\r\n]*(HP|hp) LaserJet ([^<]+)<\/title>/, :offset=>1 },

# Model Detection # Color
{ :model=>/<title>[\r\n]*(HP|hp) Color LaserJet ([^<]+)<\/title>/i, :offset=>1, :module=>"color" },

]

# Passive #
def passive
        m=[]

	# Server: HP-ChaiServer
	m << { :version=>@meta['server'].scan(/HP-ChaiServer\/([\d\.]+)/) } if @meta['server'] =~ /HP-ChaiServer\/([\d\.]+)/

	# Server: HP-ChaiSOE
	m << { :version=>@meta['server'].scan(/HP-ChaiSOE\/([\d\.]+)/) } if @meta['server'] =~ /HP-ChaiSOE\/([\d\.]+)/

	# Location: hp/device/this.LCDispatcher
	m << { :name=>"HTTP Location Header" } if @meta['location'] =~ /hp\/device\/this.LCDispatcher/

	# Return passive matches
        m

end


end

