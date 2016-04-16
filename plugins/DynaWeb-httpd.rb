##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DynaWeb-httpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "DynaWeb web server. Ships with Sun Microsystem's AnswerBook"
website "http://www.oracle.com/"

# More Info #
# http://osdir.com/ml/os.solaris.sunhelp/2001-09/msg00527.html

# ShodanHQ results as at 2011-08-07 #
# 5 for dwhttpd



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^dwhttpd\/([^\s]+) \(([^\s^;^\)]+; [^\s^\)]+)\)$/
		m << { :version=>"#{$1}" }
		m << { :string=>"#{$2}" }
	end

	# Return passive matches
	m
end
end

