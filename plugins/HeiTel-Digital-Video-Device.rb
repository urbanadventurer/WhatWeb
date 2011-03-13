##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HeiTel-Digital-Video-Device" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "HeiTel Digital Video Device - Platform-independent live image transmission and camera remote control via PC, Smartphone and PDA browser  - Homepage: http://www.heitel.com/en/products/software/web-server/index.html"
# Data Sheet: http://www.heitel.com/upload/downloads/en/04-data-sheets/english/pr_ws_gb.pdf

# ShodanHQ results as at 2011-03-14 #
# 1,750 for HeiTel GmbH Web Server

# Examples #
examples %w|
webserver1.heitel.com
webserver2.heitel.com
91.19.101.4
74.92.130.21
86.47.54.171
195.60.131.226
80.229.133.13
62.202.20.155
178.237.119.200
81.149.205.180
80.83.110.246
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^HeiTel GmbH Web Server \[V([\d\.]+)\/V([\d\.]+)\/V([\d\.]+)\]$/) } if @meta["server"] =~ /^HeiTel GmbH Web Server \[V([\d\.]+)\/V([\d\.]+)\/V([\d\.]+)\]$/

	# Return passive matches
	m

end

end

