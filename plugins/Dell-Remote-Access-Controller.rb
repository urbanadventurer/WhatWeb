##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dell-Remote-Access-Controller" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Dell Remote Access Controller or DRAC, an interface card from Dell Inc, provides out-of-band management facilities. The controller has its own processor, memory, network connection, and access to the system bus. Key features include power management, virtual media access and remote console capabilities, all available through a supported web browser or command line interface. - Homepage: http://www.dell.com/content/topics/global.aspx/power/en/ps2q02_bell?c=us&l=en"
# Documentation: http://support.dell.com/support/edocs/software/smdrac3/
# More Info: http://en.wikipedia.org/wiki/Dell_DRAC
# Default Login: root/calvin

# ShodanHQ results as at 2011-03-13 #
# 9,536 for RAC_ONE_HTTP

# Examples #
examples %w|
68.236.196.235
92.51.187.233
38.113.6.62
86.109.110.205
82.147.22.83
195.8.182.245
206.128.80.155
80.93.92.134
202.3.143.58
70.86.63.150
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^RAC_ONE_HTTP ([\d\.]+)$/) } if @meta["server"] =~ /^RAC_ONE_HTTP ([\d\.]+)$/

	# Return passive matches
	m

end

end

