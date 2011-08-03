##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

#version 0.2 Andrew Horton - added matches[] for device protected by passwords, removed out of date examples

Plugin.define "Grandstream-Phone" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.2"
description "Grandstream Networks is the leading manufacturer of IP voice/video telephony and video surveillance solutions. - Homepage: http://www.grandstream.com/"

# ShodanHQ results as at 2011-03-14 #
# 25,344 for Grandstream

# Examples #
examples %w|
216.54.149.49
84.28.128.218
62.165.255.156
78.32.89.204
109.73.41.210
|

matches [
{:text=>'<title>Grandstream Device Configuration</title>'},
{:text=>'All Rights Reserved Grandstream Networks, Inc.', :url=>"/"}
]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Grandstream/

		# Model Detection
		m << { :model=>@meta["server"].scan(/^Grandstream ([^\s]+) [\d\.]+$/) } if @meta["server"] =~ /^Grandstream ([^\s]+) [\d\.]+$/

		# Version Detection
		m << { :version=>@meta["server"].scan(/^Grandstream [^\s]+ ([\d\.]+)$/) } if @meta["server"] =~ /^Grandstream [^\s]+ ([\d\.]+)$/

		m << { :version=>@meta["server"].scan(/^Grandstream\/([\d\.]+)$/) } if @meta["server"] =~ /^Grandstream\/([\d\.]+)$/

	end

	# Return passive matches
	m
end

end

