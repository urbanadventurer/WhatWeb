##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "uClinux-httpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "The Linux/Microcontroller project (uClinux) is a port of Linux to systems without a Memory Management Unit (MMU). This plugin identifies the version of the uClinux HTTP server - Homepage: http://www.uclinux.org/"

# ShodanHQ results as at 2011-04-08 #
# 6,633 for uClinux-httpd

# Examples #
examples %w|
92.146.137.180
75.60.14.25
190.100.43.93
92.24.89.220
115.160.162.86
78.187.211.176
189.223.17.49
189.16.92.54
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :os=>"uClinux", :version=>@meta["server"].scan(/^uClinux-httpd ([\d\.]+)$/) } if @meta["server"] =~ /^uClinux-httpd ([\d\.]+)$/

	# Return passive matches
	m
end

end

