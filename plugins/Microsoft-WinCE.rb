##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft-WinCE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "Microsoft Windows CE HTTP Server - Homepage: http://msdn.microsoft.com/en-us/library/ms834461.aspx"

# ShodanHQ results as at 2011-03-13 #
# 18,324 for Microsoft-WinCE



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Microsoft-WinCE\/([^\s^\r^\n]+)$/) } if @headers["server"] =~ /^Microsoft-WinCE\/([^\s^\r^\n]+)$/

	# Return passive matches
	m

end

end

