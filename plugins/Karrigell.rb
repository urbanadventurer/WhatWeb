##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Karrigell" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Karrigell is a flexible Python web framework, with a clear and intuitive syntax. It is independent from any database, ORM or templating engine, and lets the programmer choose between a variety of coding styles. - Homepage: http://karrigell.sourceforge.net/en/index.html"

# ShodanHQ results as at 2011-05-30 #
# 69 for Karrigell
#  6 for Karrigell -Python

# Examples #
examples %w|
79.4.7.196
84.253.152.102
88.56.195.121
88.56.85.91
88.191.140.24
111.161.24.51
113.105.93.32
208.84.146.91
210.66.102.100
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Karrigell\/([^\s]+) /) } if @meta["server"] =~ /^Karrigell\/([^\s]+) /

	# Version Detection # HTTP Server Header
	m << { :version=>@meta["server"].scan(/^Karrigell ([^\s]+)$/) } if @meta["server"] =~ /^Karrigell ([^\s]+)$/

	# Return passive matches
	m
end

end

