##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Orenosv" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-09
version "0.1"
description "Orenosv is a stable, reliable and high performance HTTP/FTP/FTPS file server that can operate in 24H/365D. Orenosv runs on Windows platforms (NT, 2000, XP and 2003) and Linux x86.  - Homepage: http://www.orenosv.com/orenosv_en.html"

# ShodanHQ results as at 2011-06-09 #
# 18 for orenosv
# All results are from Japan



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^orenosv\/([^\s]+)$/) } if @headers["server"] =~ /^orenosv\/([^\s]+)$/

	# Return passive matches
	m
end

end

