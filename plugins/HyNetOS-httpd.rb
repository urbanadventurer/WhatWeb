##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HyNetOS-httpd" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "HyNetOS is a network operating system specifically designed for embedded systems, where computing and memory resources are limited. - Homepage: http://www.msc-ge.com/en/produkte/elekom/mc/hyperstone/sw_hynetos.html"

# ShodanHQ results as at 2011-04-11 #
# 6,124 for HyNetOS



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :os=>"HyNetOS", :version=>@headers["server"].scan(/^HyNetOS\/([^\s]+)$/) } if @headers["server"] =~ /^HyNetOS\/([^\s]+)$/

	# Return passive matches
	m
end

end

