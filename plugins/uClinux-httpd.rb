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



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :os=>"uClinux", :version=>@headers["server"].scan(/^uClinux-httpd ([\d\.]+)$/) } if @headers["server"] =~ /^uClinux-httpd ([\d\.]+)$/

	# Return passive matches
	m
end

end

