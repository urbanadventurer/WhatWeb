##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Xerver" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "Xerver is an advanced free GNU GPL Web and FTP server. - Homepage: http://www.javascript.nu/xerver/"

# ShodanHQ results as at 2011-05-20 #
# 182 for Xerver



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Xerver\/([\d\.]+)$/) } if @headers["server"] =~ /^Xerver\/([\d\.]+)$/

	# Return passive matches
	m
end

end

