##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RealVNC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "RealVNC provides remote control software which lets you see and interact with desktop applications across any network."
website "http://www.realvnc.com/"

# ShodanHQ results as at 2011-03-13 #
# 872 for RealVNC

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^RealVNC\/(.+)$/) } if @headers["server"] =~ /^RealVNC\/(.+)$/

	# Return passive matches
	m

end

end

